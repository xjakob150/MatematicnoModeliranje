from flask import Flask, render_template, request, jsonify
import random
from flask_cors import CORS
app = Flask(__name__)
CORS(app)

class Categorizer:
    @staticmethod
    def get_context(group, topic):
        target = "Mame (35-44)" if group in ["7-9", "10-12"] else "Starši in mladi"
        mapping = {
            "7-9":  {"subgroup": "Scratch",               "target": target,          "platform": "Instagram"},
            "10-12":{"subgroup": "Minecraft Education",   "target": target,          "platform": "Facebook"},
            "13-15":{"subgroup": "Python",                "target": target,          "platform": "Facebook"},
            "16":   {"subgroup": "Umetna inteligenca",    "target": "Mladi in starši","platform": "Instagram"}
        }
        return mapping.get(group, {"subgroup": "Splošno", "target": "Starši", "platform": "Facebook"})


class AIModel:
    @staticmethod
    def generate(context, topic):
        text = (
            f"🚀 {topic} za mlade genije! Dragi starši ({context['target']}), "
            f"vaš otrok bo skozi {context['subgroup']} razvijal logiko in ustvarjalnost. "
            f"Pridružite se nam na poti od igranja do ustvarjanja! 💻✨"
        )
        image_url = f"https://placehold.co/600x400?text=Coding+Giants+{context['subgroup'].replace(' ', '+')}"
        return text, image_url


class Predictor:
    @staticmethod
    def get_csv_based_reach(platform, subgroup):
        base_metrics = {
            "Facebook":  {"clicks": 85, "interactions": 15},
            "Instagram": {"clicks": 25, "interactions": 10}
        }
        stats = base_metrics.get(platform, base_metrics["Facebook"])
        multiplier = 45
        topic_boost = 1.3 if subgroup == "Minecraft Education" else 1.0
        reach = (stats['clicks'] + stats['interactions']) * multiplier * topic_boost
        return int(reach * random.uniform(0.9, 1.1))


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/generate', methods=['POST'])
def generate_post():
    try:
        data = request.get_json()
        if not data:
            return jsonify({"error": "Ni podatkov v zahtevi."}), 400

        group = data.get('group')
        topic = data.get('topic', '').strip()

        if not group or not topic:
            return jsonify({"error": "Manjka skupina ali tema."}), 400

        context = Categorizer.get_context(group, topic)
        text, img = AIModel.generate(context, topic)
        reach = Predictor.get_csv_based_reach(context['platform'], context['subgroup'])

        reach_formatted = f"{reach:,}".replace(',', '.')

        return jsonify({
            "text": text,
            "image": img,
            "reach": f"Pričakovan doseg ({context['platform']}): {reach_formatted} uporabnikov",
            "context": context
        })

    except Exception as e:
        app.logger.error(f"Napaka v /generate: {e}")
        return jsonify({"error": f"Strežniška napaka: {str(e)}"}), 500


if __name__ == '__main__':
    app.run(debug=True)