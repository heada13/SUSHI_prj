from flask import Flask, render_template
from flask_restful import Resource, Api
from pycoingecko import CoinGeckoAPI
# from flask_cors import CORS

# app = Flask(__name__, static_folder='../front/dist/static', template_folder='../front/dist')
app = Flask(__name__)
# CORS(app)
api = Api(app)

# class HelloWorld(Resource):
#     def get(self):
#         return {'hello': 'world'}

# api.add_resource(HelloWorld, '/')


@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
class HelloWorld(Resource):
    def get_coin():
        cg = CoinGeckoAPI()
        # cg.ping()
        bitcoin = cg.get_price(ids='bitcoin', vs_currencies='usd')
        return bitcoin

api.add_resource(HelloWorld, '/')


# def index(path):
#     # return render_template('index.html')
#     cg = CoinGeckoAPI()
#     # cg.ping()
#     bitcoin = cg.get_price(ids='bitcoin', vs_currencies='usd')
#     return bitcoin

# main画面でsushiの価格を取得する
# @app.route('/main', methods=["GET"])
# def get_coin():
#         cg = CoinGeckoAPI()
#         # cg.ping()
#         bitcoin = cg.get_price(ids='bitcoin', vs_currencies='usd')
#         return bitcoin


if __name__ == '__main__':
    app.run()