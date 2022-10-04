from flask import Flask

app = Flask("__main__")

@app.route("/")
def hello_world():
        return "<p>Hello, World!</p>"

app.run(host='0.0.0.0', port=80)
