import 'package:code_challenge/features/converter/domain/entities/conversion%20_rate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteConversionDataSource {
  final String apiKey = '0cb1978675179485354b';
  final http.Client client;

  RemoteConversionDataSource(this.client);

  Future<ConversionRate> fetchConversionRate(String fromCurrency, String toCurrency) async {
    final response = await client.get(
      Uri.parse('https://free.currencyconverterapi.com/api/v6/convert?q=${fromCurrency}_${toCurrency}&compact=ultra&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final rate = data['${fromCurrency}_${toCurrency}'];
      return ConversionRate(
        fromCurrency: fromCurrency,
        toCurrency: toCurrency,
        rate: rate,
      );
    } else {
      throw Exception('Failed to fetch conversion rate');
    }
  }
}
