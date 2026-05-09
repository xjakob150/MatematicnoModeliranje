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

import mysql.connector
from werkzeug.security import generate_password_hash, check_password_hash
import jwt
import datetime
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
# 1) NALAGANJE MODELA IN ENCODERJA
# ---------------------------------------------------------
try:
    bundle = joblib.load("model_bundle.pkl")
    model = bundle["model"]
    encoder_tema = bundle["encoder_tema"]
    print("✅ Model uspešno naložen.")
except Exception as e:
    print(f"❌ Napaka pri nalaganju modela: {e}")
    
try:
    df_posts = pd.read_csv("Objave_mar2025_mar2026_FB.csv")
    fifth_column = df_posts.iloc[:, 4].dropna().tolist()  # 5. stolpec (index 4)
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

def get_numeric_age(group_str):
    """Pretvori npr. '7-9' v 7.0 (spodnja meja, kot v treningu)."""
    try:
        return float(group_str.split('-')[0])
    except:
        return 10.0 # Default če pride do napake

def predict_reach(text, age_group):
    # 1. Izlušči in mapiraj teme
    detected = extract_themes_from_text(text)
    mapped = [map_user_theme(t) for t in detected]
    
    # 2. One-hot encoding (pazi: transform pričakuje 2D array)
    tema_encoded = encoder_tema.transform(np.array(mapped).reshape(-1, 1))
    
    # Če je več tem, jih seštejemo v en vektor (tako kot v tvojem trening skriptu)
    tema_vector = tema_encoded.sum(axis=0).reshape(1, -1)
    
    # 3. Starost
    age_val = get_numeric_age(age_group)
    starost_vector = np.array([[age_val]])
    
    # 4. Združi v X in napovej
    X_input = np.hstack([tema_vector, starost_vector])
    prediction = model.predict(X_input)[0]
    
    return max(0, int(round(prediction))) # Preprečimo negativne številke

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
                model="gemini-3-flash-preview", # Uporabi stabilno verzijo
                contents=prompt
            )
            text = response.text
        except Exception as e:
            print(f"Napaka Gemini: {e}")
            text = f"Pridružite se nam na delavnici {topic}! 🚀"

        image_url = f""
        return text, image_url

# ---------------------------------------------------------
# 4) POTI (ROUTES)
# ---------------------------------------------------------

@app.route('/')
def login_page():
    # To bo odprlo login.html ob obisku http://127.0.0.1:5000
    return render_template('login.html')

@app.route('/index.html')
def index_page():
    # To je stran, na katero te vrže JS funkcija
    return render_template('index.html')

@app.route('/generate', methods=['POST'])
@token_required # dodal merih da preverja jwt
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

        if not group or not topic:
            return jsonify({"error": "Manjka skupina ali tema."}), 400

        
        # 1. Generiraj besedilo z AI
        generated_text, img_url = AIModel.generate(topic, description, time, mood, length, platform)
        
        # 2. Napovej doseg z XGBoost modelom
        reach_val = predict_reach(generated_text, group)
        reach_formatted = f"{reach_val:,}".replace(',', '.')

        return jsonify({
            "text": generated_text,
            "image": img_url,
            "reach": f"Pričakovan doseg: {reach_formatted} uporabnikov"
        })

    except Exception as e:
        app.logger.error(f"Napaka v /generate: {e}")
        return jsonify({"error": f"Strežniška napaka: {str(e)}"}), 500

# ---------------------------------------------------------
#  LOGIN/REGISTRACIJSKA STRAN (dodal merih)
# ---------------------------------------------------------

# Povezava na bazo
def povezava():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",          
        database="matematicnomodeliranje"
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

@app.route("/registracija-stran")
def registracija_stran():
    return render_template("registracija.html")

@app.route("/prijava-stran")
def prijava_stran():
    return render_template("prijava.html")

if __name__ == '__main__':
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)