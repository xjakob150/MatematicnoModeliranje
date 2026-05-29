from flask import Flask, render_template, request, jsonify
import joblib
import mysql.connector
import os
from dotenv import load_dotenv
import numpy as np
import pandas as pd
import random
from google import genai
from flask_cors import CORS
import emoji
import mysql.connector
from werkzeug.security import generate_password_hash, check_password_hash
import jwt
import datetime
import subprocess
from functools import wraps


app = Flask(__name__)
CORS(app)


load_dotenv()


# ---------------------------------------------------------
# JWT PREVERJANJE TOKENA (dodal merih)
# ---------------------------------------------------------

SECRET_KEY = os.getenv("JWT_SECRET_KEY", "skritiKljuc")

def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        auth_header = request.headers.get("Authorization")

        if not auth_header:
            return jsonify({"napaka": "Token manjka"}), 401

        try:
            token = auth_header.split(" ")[1]
            data = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
            request.uporabnik_id = data["id_uporabnika"]

        except jwt.ExpiredSignatureError:
            return jsonify({"napaka": "Token je potekel"}), 401

        except:
            return jsonify({"napaka": "Token ni veljaven"}), 401

        return f(*args, **kwargs)

    return decorated

# ---------------------------------------------------------
# 1) NALAGANJE MODELA IN ENCODERJA - test
# ---------------------------------------------------------
try:
    model = joblib.load("model.pkl")
    encoder_tema = joblib.load("encoder_tema.pkl")
    print("✅ Model in Encoder uspešno naložena.")
except Exception as e:
    print(f"❌ Napaka pri nalaganju modela: {e}")
    
try:
    df_posts = pd.read_csv("Objave_mar2025_mar2026_FB.csv")
    fifth_column = df_posts.iloc[:, 4].dropna().tolist()
    print("✅ CSV uspešno naložen.")
except Exception as e:
    print(f"❌ Napaka pri branju CSV: {e}")
    fifth_column = []

# ---------------------------------------------------------
# 2) POMOŽNE FUNKCIJE ZA NLP IN PREDIKCIJO
# ---------------------------------------------------------

def extract_themes_from_text(text):
    text = text.lower()
    themes = []
    if any(w in text for w in ["ai", "umetna inteligenca", "machine learning", "strojno učenje"]):
        themes.append("Umetna inteligenca")
    if any(w in text for w in ["scratch", "igra", "game", "pygame"]):
        themes.append("Programiranje iger")
    if "minecraft" in text:
        themes.append("Minecraft")
    if any(w in text for w in ["html", "css", "javascript", "splet", "web"]):
        themes.append("Razvoj spletnih strani")
    if any(w in text for w in ["brezplač", "delavnica", "prijava"]):
        themes.append("Brezplačne delavnice")
    if any(w in text for w in ["varnost", "phishing", "geslo", "zasebnost"]):
        themes.append("Varnost na spletu")
    if "appinventor" in text or "app inventor" in text:
        themes.append("Appinventor")
    if any(w in text for w in ["algoritem", "algoritmi", "logika"]):
        themes.append("Algoritmi")
    if "python" in text:
        themes.append("Python")
    
    return themes if themes else ["Drugo"]

def map_user_theme(theme):
    mapping = {
        "Programiranje iger": "Programiranje iger",
        "Algoritmi": "Programiranje iger",
        "Razvoj spletnih strani": "Razvoj spletnih strani",
        "Appinventor": "Programiranje iger",
        "Varnost na spletu": "Varnost na spletu",
        "Brezplačne delavnice": "Drugo",
        "Umetna inteligenca": "Umetna inteligenca",
        "Minecraft": "Minecraft",
        "Python": "Python"
    }
    return mapping.get(theme, "Drugo")

def extract_text_features(text):
    if not isinstance(text, str): text = ""
    num_chars = len(text)
    num_words = len(text.split())
    num_lines = text.count("\n") + 1
    num_emojis = sum(1 for char in text if char in emoji.EMOJI_DATA)
    num_exclaims = text.count("!")
    num_questions = text.count("?")
    num_periods = text.count(".")
    paragraphs = text.split("\n")
    longest_paragraph = max(len(p) for p in paragraphs) if paragraphs else 0
    emoji_ratio = num_emojis / num_words if num_words > 0 else 0
    punctuation_ratio = (num_exclaims + num_questions + num_periods) / num_chars if num_chars > 0 else 0

    return [
        num_chars, num_words, num_lines, num_emojis,
        num_exclaims, num_questions, num_periods,
        longest_paragraph, emoji_ratio, punctuation_ratio
    ]

def get_numeric_age(group_str):
    """Pretvori npr. '7-9' v 7.0 (spodnja meja, kot v treningu)."""
    try:
        return float(group_str.split('-')[0])
    except:
        return 10.0

def predict_reach(text, age_group):
    # 1. Teme
    detected = extract_themes_from_text(text)
    mapped = [map_user_theme(t) for t in detected]
    tema_encoded = encoder_tema.transform(np.array(mapped).reshape(-1, 1))
    tema_vector = tema_encoded.sum(axis=0).reshape(1, -1)
    
    age_val = get_numeric_age(age_group)
    starost_vector = np.array([[age_val]])
    
    text_features = extract_text_features(text)
    text_vector = np.array([text_features])
    
    X_input = np.hstack([tema_vector, starost_vector, text_vector])
    
    prediction = model.predict(X_input)[0]
    return max(0, int(round(prediction)))

# ---------------------------------------------------------
# 3) GEMINI KONFIGURACIJA
# ---------------------------------------------------------
api_key = os.getenv("GEMINI_API_KEY")

if not api_key:
    raise Exception("Missing GEMINI_API_KEY in .env")

client = genai.Client(api_key=api_key)

class AIModel:
    @staticmethod
    def generate(topic, description, time, mood, length, platform):
        example_post = random.choice(fifth_column) if fifth_column else ""
        prompt = (
            f"Napiši privlačno objavo za družbena omrežja za šolo programiranja Coding Giants. "
            f"Tema objave je {topic}, upoštevaj da je {time} in naj je v {mood} razpoloženju. Naj je dolgo {length}. Imej v mislih, daje objava za {platform}."
            f"Vključi nekaj emojijev in bodi spodbuden. Odgovori izključno v slovenščini. "
            f"Samo napiši besedilo objave brez uvodnih besed. "
            f"Navdih naj bo tudi iz tega primera: {example_post}"
            f"Dodatno upoštevaj navodilo uporabnika: {description}"
        )
        
        try:
            response = client.models.generate_content(
                model="gemini-3-flash-preview",
                contents=prompt
            )
            text = response.text
        except Exception as e:
            import traceback
            print("❌ GEMINI ERROR:")
            traceback.print_exc()
            print(f"Napaka Gemini: {e}")
            text = f"Pridružite se nam na delavnici {topic}! 🚀"

        image_url = f""
        return text, image_url

# ---------------------------------------------------------
# 4) POTI (ROUTES)
# ---------------------------------------------------------

@app.route('/')
def login_page():
    return render_template('login.html')

@app.route('/index.html')
def index_page():
    return render_template('index.html')

@app.route('/generate', methods=['POST'])
@token_required
def generate_post():
    try:
        data = request.get_json(force=True)
        if not data:
            return jsonify({"error": "Ni podatkov."}), 400

        group = data.get('group')
        topic = data.get('topic', '').strip()
        description = data.get('description', '')
        time = data.get("time", "")
        mood = data.get("mood", "")
        length = data.get("length", "")
        platform = data.get("platform","")
        
        if(platform == "facebook"):
            platform = 1
        elif(platform == "instagram"):  
            platform = 2

        uporabnik_id = request.uporabnik_id

        if not group or not topic:
            return jsonify({"error": "Manjka skupina ali tema."}), 400

        
        generated_text, img_url = AIModel.generate(topic, description, time, mood, length, platform)
        
        reach_val = predict_reach(generated_text, group)
        reach_formatted = f"{reach_val:,}".replace(',', '.')
        
        # ---------------------------------------------------------
        # SHRANJEVANJE V BAZO
        # ---------------------------------------------------------
        try:
            conn = povezava()
            cursor = conn.cursor()
            
            sql = """
                INSERT INTO generiranje_oglasa 
                (id_uporabnika, opis_objave, predviden_doseg, teme_objave, id_platforme, casovno_obdobje, razpolozenje_objave, starostna_skupina, dolzina_objave, datum_ustvarjanja) 
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """
            values = (
                uporabnik_id, 
                generated_text, 
                reach_val, 
                topic, 
                platform,
                time, 
                mood,
                group,
                length,
                datetime.datetime.now()
            )
            
            cursor.execute(sql, values)
            conn.commit()
            
            cursor.close()
            conn.close()
            print("✅ Oglas uspešno shranjen v bazo.")
        except Exception as db_e:
            print(f"❌ Napaka pri shranjevanju v bazo: {db_e}")
        # ---------------------------------------------------------

        return jsonify({
            "text": generated_text,
            "image": img_url,
            "reach": f"Pričakovan doseg: {reach_formatted} uporabnikov"
        })

    except Exception as e:
        app.logger.error(f"Napaka v /generate: {e}")
        return jsonify({"error": f"Strežniška napaka: {str(e)}"}), 500

# ---------------------------------------------------------
#  LOGIN/REGISTRACIJSKA STRAN 
# ---------------------------------------------------------

# Povezava na bazo
def povezava():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST", "db"),
        user=os.getenv("DB_USER", "root"),
        password=os.getenv("DB_PASSWORD", ""),
        database=os.getenv("DB_NAME", "matematicnomodeliranje")
    )

@app.route("/registracija", methods = ["POST"])
def registracija():
    data = request.get_json()

    ime = data.get("ime")
    priimek = data.get("priimek")
    email = data.get("email")
    geslo = data.get("geslo")

    if not ime or not priimek or not email or not geslo:
        return jsonify({"Napaka" : "Manjkajo podatki"}), 400
    
    geslo_hash = generate_password_hash(geslo)

    conn = povezava()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM uporabnik WHERE email = %s", (email,) )
    obstojec = cursor.fetchone()

    if obstojec:
        cursor.close()
        conn.close()
        return jsonify({"napaka": "Uporabnik s tem emailom že obstaja"}), 409
    
    cursor.execute("""
        INSERT INTO uporabnik (ime,priimek, email, geslo)
        VALUES (%s, %s, %s, %s)
    """, (ime, priimek, email, geslo_hash))

    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({"sporocilo": "Registracija uspešna"}), 201


@app.route("/prijava", methods=["POST"])
def prijava():
    data = request.get_json()

    email = data.get("email")
    geslo = data.get("geslo")

    if not email or not geslo:
        return jsonify({"napaka": "Vnesi email in geslo"}), 400
    
    conn = povezava()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM uporabnik WHERE email = %s", (email,))
    uporabnik = cursor.fetchone()

    cursor.close()
    conn.close()

    if uporabnik and check_password_hash(uporabnik["geslo"], geslo):
        token = jwt.encode({
            "id_uporabnika": uporabnik["id_uporabnika"],
            "email": uporabnik["email"],
            "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=2)
        }, SECRET_KEY, algorithm="HS256")

        return jsonify({
            "sporocilo": "Prijava uspešna",
            "token": token
        }), 200

    return jsonify({"napaka": "Napačen email ali geslo"}), 401

@app.route('/zgodovina', methods=['GET'])
@token_required
def dobi_zgodovino():
    try:
        uporabnik_id = request.uporabnik_id
        conn = povezava()
        cursor = conn.cursor(dictionary=True)
        
        query = """
            SELECT id_oglasa, teme_objave, opis_objave, datum_ustvarjanja 
            FROM generiranje_oglasa 
            WHERE id_uporabnika = %s 
            ORDER BY datum_ustvarjanja DESC 
            LIMIT 10
        """
        cursor.execute(query, (uporabnik_id,))
        rezultati = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return jsonify(rezultati), 200
    except Exception as e:
        return jsonify({"napaka": str(e)}), 500

@app.route('/starostne-skupine', methods=['GET'])
def pridobi_starostne_skupine():
    try:
        conn = povezava()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT ime_tecaja, starostna_skupina, cena FROM tecaji")
        skupine = cursor.fetchall()
        
        cursor.close()
        conn.close()
        return jsonify(skupine), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/registracija-stran")
def registracija_stran():
    return render_template("registracija.html")

@app.route('/uporabnik', methods=['GET'])
@token_required
def pridobi_uporabnika():
    try:
        uporabnik_id = request.uporabnik_id
        conn = povezava()
        cursor = conn.cursor(dictionary=True)
        
        cursor.execute("SELECT ime, priimek, email FROM uporabnik WHERE id_uporabnika = %s", (uporabnik_id,))
        uporabnik = cursor.fetchone()
        
        cursor.close()
        conn.close()
        
        if uporabnik:
            return jsonify(uporabnik), 200
        else:
            return jsonify({"napaka": "Uporabnik ni najden"}), 404
    except Exception as e:
        return jsonify({"napaka": str(e)}), 500
    
#---------------------
#dodal merih userpage
#_____________
@app.route('/user', methods=['PUT'])
@token_required
def update_user():
    try:
        user_id = request.uporabnik_id
        data = request.get_json()

        first_name = data.get("first_name")
        last_name = data.get("last_name")
        email = data.get("email")
        new_password = data.get("new_password")

        if not first_name or not last_name or not email:
            return jsonify({"error": "First name, last name and email are required"}), 400

        conn = povezava()
        cursor = conn.cursor(dictionary=True)

        cursor.execute(
            "SELECT id_uporabnika FROM uporabnik WHERE email = %s AND id_uporabnika != %s",
            (email, user_id)
        )
        existing_user = cursor.fetchone()

        if existing_user:
            cursor.close()
            conn.close()
            return jsonify({"error": "This email is already in use"}), 409

        if new_password:
            password_hash = generate_password_hash(new_password)
            cursor.execute("""
                UPDATE uporabnik
                SET ime = %s, priimek = %s, email = %s, geslo = %s
                WHERE id_uporabnika = %s
            """, (first_name, last_name, email, password_hash, user_id))
        else:
            cursor.execute("""
                UPDATE uporabnik
                SET ime = %s, priimek = %s, email = %s
                WHERE id_uporabnika = %s
            """, (first_name, last_name, email, user_id))

        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({"message": "User data updated successfully"}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
@app.route('/deploy-trigger', methods=['POST'])
def deploy_trigger():
    token = request.headers.get("X-Webhook-Secret")

    if token != os.getenv("MY_WEBHOOK_SECRET"):
        return jsonify({"error": "unauthorized"}), 403

    # napišemo signal na HOST preko shared volume
    with open("/tmp/deploy.trigger", "w") as f:
        f.write("1")

    return jsonify({"status": "deploy triggered"})

@app.route("/prijava-stran")
def prijava_stran():
    return render_template("login.html")#

@app.route('/user-stran')
def user_page():
    return render_template('user.html')

#####################