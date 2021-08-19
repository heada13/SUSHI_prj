from flask import Flask, jsonify, request, render_template
from pycoingecko import CoinGeckoAPI

app = Flask(__name__, static_folder='../../front/dist/static', template_folder='../../front/dist')
# app = Flask(__name__)

incomes = [
  { 'description': 'salary', 'amount': 5000 }
]

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def index(path):
    return render_template('index.html')

@app.route('/incomes')
def get_incomes():
  return jsonify(incomes)


@app.route('/incomes', methods=['POST'])
def add_income():
  incomes.append(request.get_json())
  return '', 204

@app.route('/main/<coin>',methods=['GET'])
def get_coin(coin):
    cg = CoinGeckoAPI()
    # cg.ping()
    print("run bitcoin")
    bitcoin = cg.get_price(ids=coin, vs_currencies='usd')
    return bitcoin