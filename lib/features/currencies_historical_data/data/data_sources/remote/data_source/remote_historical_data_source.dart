import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../domain/entities/currenciesHistoricalDataModel.dart';

class RemoteHistoricalDataSource {
  final http.Client client;
  final String apiKey;

  RemoteHistoricalDataSource(this.client) : apiKey = '0cb1978675179485354b';

  Future<Map<String, List<HistoricalData>>> fetchHistoricalData(String currencyPair1, String currencyPair2) async {
    final baseUrl = 'https://free.currencyconverterapi.com/api/v6';
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, now.day - 7).toIso8601String().split('T').first;
    final endDate = now.toIso8601String().split('T').first;

    final url1 = '$baseUrl/convert?q=$currencyPair1&compact=ultra&date=$startDate&endDate=$endDate&apiKey=$apiKey';
    final url2 = '$baseUrl/convert?q=$currencyPair2&compact=ultra&date=$startDate&endDate=$endDate&apiKey=$apiKey';

    print("Request URL 1: $url1");
    print("Request URL 2: $url2");

    final response1 = await client.get(Uri.parse(url1));
    final response2 = await client.get(Uri.parse(url2));

    if (response1.statusCode == 200 && response2.statusCode == 200) {
      final data1 = json.decode(response1.body) as Map<String, dynamic>;
      final data2 = json.decode(response2.body) as Map<String, dynamic>;

      print("Fetched Data 1: $data1");
      print("Fetched Data 2: $data2");

      Map<String, List<HistoricalData>> historicalData = {
        currencyPair1: _parseData(data1, currencyPair1),
        currencyPair2: _parseData(data2, currencyPair2),
      };

      print("Parsed Data: $historicalData");
      return historicalData;
    } else {
      print("Failed to fetch data with status code: ${response1.statusCode} and ${response2.statusCode}");
      print("Error 1: ${response1.body}");
      print("Error 2: ${response2.body}");
      throw Exception('Failed to load historical data');
    }
  }

  List<HistoricalData> _parseData(Map<String, dynamic> data, String currencyPair) {
    List<HistoricalData> historicalDataList = [];

    data[currencyPair]?.forEach((date, rate) {
      if (rate is num) {
        historicalDataList.add(HistoricalData.fromJson({'date': date, 'rate': rate}));
      }
    });

    return historicalDataList;
  }
}
