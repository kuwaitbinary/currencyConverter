import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:code_challenge/features/supported_currencies/data/remote/data_sources/remote_currency_data_source.dart';
import 'package:code_challenge/features/supported_currencies/domain/entities/currency.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late RemoteCurrencyDataSource dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = RemoteCurrencyDataSource(mockHttpClient);
  });

  group('fetchCurrencies', () {
    final tCurrencyList = [
      Currency(code: 'USD', name: 'United States Dollar'),
      Currency(code: 'EUR', name: 'Euro'),
    ];

    test('should return list of currencies when the response is 200 (success)', () async {
      // Arrange
      final uri = Uri.parse('https://free.currencyconverterapi.com/api/v6/currencies?apiKey=0cb1978675179485354b');
      when(mockHttpClient.get(uri)).thenAnswer(
            (_) async => http.Response(
          json.encode({
            'results': {
              'USD': {'id': 'USD', 'currencyName': 'United States Dollar'},
              'EUR': {'id': 'EUR', 'currencyName': 'Euro'},
            }
          }),
          200,
        ),
      );

      // Act
      final result = await dataSource.fetchCurrencies();

      // Assert
      expect(result, tCurrencyList);
    });

    test('should throw an exception when the response code is not 200', () async {
      // Arrange
      final uri = Uri.parse('https://free.currencyconverterapi.com/api/v6/currencies?apiKey=0cb1978675179485354b');
      when(mockHttpClient.get(uri)).thenAnswer(
            (_) async => http.Response('Something went wrong', 404),
      );

      // Act
      final call = dataSource.fetchCurrencies;

      // Assert
      expect(() => call(), throwsException);
    });
  });
}
