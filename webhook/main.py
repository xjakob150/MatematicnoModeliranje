from flask import Flask, request, jsonify
import subprocess
import os

app = Flask(__name__)
SECRET = os.getenv("MY_WEBHOOK_SECRET")

@app.route("/deploy", methods=["POST"])
def deploy():
    received_secret = request.headers.get("X-Webhook-Secret")
    if received_secret != SECRET:
        return "Unauthorized", 401


    subprocess.Popen(["/app/deploy.sh"])
    
    return jsonify({"status": "deploy started"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=9000)