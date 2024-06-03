import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyService {
  
  final String apiurl ='https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?appid="72bcd06c-2aa4-4b24-b4d9-e6d20f3687fd" ';
  Future<List<dynamic>> fetchCurrencies() async {
    final response = await http.get(Uri.parse(apiurl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      return data;
    } else {
      throw Exception('failed to load currencies');
    }
  }
}
