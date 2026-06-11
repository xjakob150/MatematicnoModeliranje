from flask import Blueprint, request, jsonify
from werkzeug.security import generate_password_hash, check_password_hash
import jwt
import datetime
from database import povezava
from config import SECRET_KEY

auth_bp = Blueprint('auth', __name__)

@auth_bp.route("/registracija", methods=["POST"])
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

@auth_bp.route("/prijava", methods=["POST"])
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