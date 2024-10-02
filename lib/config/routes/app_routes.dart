import 'package:code_challenge/features/converter/presentation/pages/converter_feature_screen.dart';
import 'package:flutter/material.dart';
import 'package:code_challenge/features/currencies_historical_data/presentation/pages/currencies_historical_data_feature_screen.dart';
import 'package:code_challenge/features/supported_currencies/presentation/pages/supported_currencies_feature_screen.dart';
import 'package:code_challenge/currency_converter_home_page.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String converterPageRoute = '/converter';
  static const String currenciesHistoricalDataPageRoute = '/historical';
  static const String supportedCurrenciesPageRoute = '/supported_currencies';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => CurrencyConverterHomeScreen());
      case converterPageRoute:
        return MaterialPageRoute(builder: (_) => ConverterFeatureScreen());
      case currenciesHistoricalDataPageRoute:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => CurrenciesHistoricalDataFeatureScreen(
            currencyPair1: args['currencyPair1']!,
            currencyPair2: args['currencyPair2']!,
          ),
        );
      case supportedCurrenciesPageRoute:
        return MaterialPageRoute(
            builder: (_) => SupportedCurrenciesFeatureScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: Text('Error')),
            body: Center(child: Text('Page not found!')),
          ),
        );
    }
  }
}
