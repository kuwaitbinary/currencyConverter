import 'package:code_challenge/features/supported_currencies/domain/entities/currency.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteCurrencyDataSource {
  final String apiKey = '0cb1978675179485354b';
  final http.Client client;

  RemoteCurrencyDataSource(this.client);

  Future<List<Currency>> fetchCurrencies() async {
    final response = await client.get(
      Uri.parse(
          'https://free.currencyconverterapi.com/api/v6/currencies?apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final currencies =
          (data['results'] as Map<String, dynamic>).values.map((e) {
        return Currency(
          code: e['id'],
          name: e['currencyName'],
        );
      }).toList();
      return currencies;
    } else {
      throw Exception('Failed to load currencies');
    }
  }
}
