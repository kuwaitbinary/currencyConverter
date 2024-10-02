import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:code_challenge/currency_converter_app.dart';
import 'package:code_challenge/core/utils/app_strings.dart';
import 'package:code_challenge/core/injection.dart' as di;
import 'package:mockito/mockito.dart';
import 'package:get_it/get_it.dart';
import 'package:code_challenge/features/supported_currencies/domain/use_cases/get_currencies.dart';
import 'package:code_challenge/features/converter/domain/use_cases/get_conversion_rate.dart';
import 'package:code_challenge/features/currencies_historical_data/domain/use_cases/get_historical_data.dart';
import 'package:dartz/dartz.dart';
import 'package:code_challenge/features/supported_currencies/domain/entities/currency.dart';

class MockGetCurrencies extends Mock implements GetCurrencies {}

class MockGetConversionRate extends Mock implements GetConversionRate {}

class MockGetHistoricalData extends Mock implements GetHistoricalData {}

void main() {
  setUpAll(() {
    // Initialize the dependency injection.
    di.init();

    // Register the mock dependencies.
    final sl = GetIt.instance;
    sl.allowReassignment = true;
    final mockGetCurrencies = MockGetCurrencies();
    final mockGetConversionRate = MockGetConversionRate();
    final mockGetHistoricalData = MockGetHistoricalData();

    sl.registerLazySingleton<GetCurrencies>(() => mockGetCurrencies);
    sl.registerLazySingleton<GetConversionRate>(() => mockGetConversionRate);
    sl.registerLazySingleton<GetHistoricalData>(() => mockGetHistoricalData);

    // Set up mock behavior for GetCurrencies use case.
    when(mockGetCurrencies()).thenAnswer(
          (_) async => Right([
        Currency(code: 'USD', name: 'United States Dollar'),
        Currency(code: 'EUR', name: 'Euro'),
      ]),
    );

    // Set up mock behavior for GetConversionRate and GetHistoricalData if needed.
    // Example:
    // when(mockGetConversionRate.call(any)).thenAnswer(
    //   (_) async => Right(ConversionRate(...)),
    // );

    // when(mockGetHistoricalData.call(any)).thenAnswer(
    //   (_) async => Right(HistoricalData(...)),
    // );
  });

  testWidgets('Currency Converter App Smoke Test', (WidgetTester tester) async {
    // Build the CurrencyConverterApp and trigger a frame.
    await tester.pumpWidget(const CurrencyConverterApp());

    // Verify that the home screen is displayed by checking for the app title.
    expect(find.text(AppStrings.appName), findsOneWidget);

    // Tap on the 'Supported Currencies' button and trigger a frame.
    await tester.tap(find.text('Supported Currencies'));
    await tester.pumpAndSettle();

    // Verify that the supported currencies screen is displayed.
    expect(find.text('Supported Currencies'), findsOneWidget);

    // Tap on the 'Currencies Historical Data' button and trigger a frame.
    await tester.tap(find.text('Currencies Historical Data'));
    await tester.pumpAndSettle();

    // Verify that the historical data screen is displayed.
    expect(find.text('Currencies Historical Data'), findsOneWidget);

    // Go back to the home screen and verify.
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(find.text(AppStrings.appName), findsOneWidget);
  });
}
