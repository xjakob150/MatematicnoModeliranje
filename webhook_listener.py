# webhook_listener.py
from flask import Flask, request, abort
import subprocess

app = Flask(__name__)

SECRET_TOKEN = "12345"

@app.route('/webhook', methods=['POST'])
def webhook():
    token = request.headers.get('X-Webhook-Secret')
    if token != SECRET_TOKEN:
        abort(403)

    subprocess.Popen(["/bin/bash", "/home/xjakob150/MatematicnoModeliranje/deploy.sh"])
    return "Deployment started", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9000)