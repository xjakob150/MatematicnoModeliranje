from flask import Flask, request
import subprocess

app = Flask(__name__)

@app.route("/deploy", methods=["POST"])
def deploy():
    subprocess.Popen(["/app/deploy.sh"])
    return "Deploy started", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=9000)