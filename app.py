from flask import Flask, request, redirect, session, url_for, Response, json, render_template, send_from_directory
from werkzeug.utils import secure_filename
from flask.json import jsonify
import json
import os
import random
import time
import requests
from pymongo import MongoClient
from pprint import pprint
# from google.cloud import datastore
# from google.cloud import vision
# from google.cloud import storage
from flask_cors import CORS
# import dadjokelib


ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

app = Flask(__name__)
app.config.from_object(__name__)
CORS(app)



# datastore_client = datastore.Client.from_service_account_json('gc.json')

# with open('credentials.json', 'r') as f:
#     creds = json.load(f)

# mongostr = creds["mongostr"]
# client = MongoClient(mongostr)

# db = client["slogans"]




@app.route("/showslogan", methods=['GET', 'POST'])
def showslogan():

    print(request)

    res = request.get_json()
    print (res)

    slogan = res["slogan"].upper()
    words = slogan.split(" ")
    word1 = words[0]
    word2 = words[1]
    word3 = words[2]

    print (words)
    print(word1)
    print(word2)
    print(word3)

    ##call eink here

    # resraw = request.get_data()
    # print (resraw)

##    args = request.args
##    form = request.form
##    values = request.values

##    print (args)
##    print (form)
##    print (values)

##    sres = request.form.to_dict()
 

    status = {}
    status["server"] = "up"
    status["message"] = "some random message here"
    status["request"] = res 

    statusjson = json.dumps(status)

    print(statusjson)

    js = "<html> <body>OK THIS WoRKS</body></html>"

    resp = Response(statusjson, status=200, mimetype='application/json')
    ##resp.headers['Link'] = 'http://google.com'

    return resp




@app.route("/dummyJson", methods=['GET', 'POST'])
def dummyJson():

    print(request)

    res = request.get_json()
    print (res)

    resraw = request.get_data()
    print (resraw)

##    args = request.args
##    form = request.form
##    values = request.values

##    print (args)
##    print (form)
##    print (values)

##    sres = request.form.to_dict()
 

    status = {}
    status["server"] = "up"
    status["message"] = "some random message here"
    status["request"] = res 

    statusjson = json.dumps(status)

    print(statusjson)

    js = "<html> <body>OK THIS WoRKS</body></html>"

    resp = Response(statusjson, status=200, mimetype='application/json')
    ##resp.headers['Link'] = 'http://google.com'

    return resp


@app.route("/dummy", methods=['GET', 'POST'])
def dummy():

    ##res = request.json

    js = "<html> <body>OK THIS WoRKS</body></html>"

    resp = Response(js, status=200, mimetype='text/html')
    ##resp.headers['Link'] = 'http://google.com'

    return resp

@app.route("/api", methods=["GET"])
def index():
    if request.method == "GET":
        return {"hello": "world"}
    else:
        return {"error": 400}


if __name__ == "__main__":
    # app.run(debug=True, host = 'localhost', port = 8002)
    app.run(debug=True, host = 'localhost', port = 8004)
