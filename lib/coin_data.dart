import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'USD',
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const String url = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class CoinData {
  Future<String> getCoinData(String criptoMoeda, String moeda) async {
    try {
      http.Response response = await http.get(url + criptoMoeda + moeda);
      if (response.statusCode == 200) {
        var data = await jsonDecode(response.body);
        return '${data['last']}'.isEmpty ? '?' : '${data['last']}';
      }
    } catch (e) {
      print(e);
    }
    return '?';
  }
}
