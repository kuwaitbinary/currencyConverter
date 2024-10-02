import 'package:code_challenge/config/routes/app_routes.dart';
import 'package:code_challenge/currency_converter_home_page.dart';
import 'package:code_challenge/features/converter/presentation/pages/converter_feature_screen.dart';
import 'package:code_challenge/features/supported_currencies/presentation/pages/supported_currencies_feature_screen.dart';

final routes = {
  AppRoutes.initialRoute: (context) => const CurrencyConverterHomeScreen(),
  AppRoutes.converterPageRoute: (context) => ConverterFeatureScreen(),
  AppRoutes.supportedCurrenciesPageRoute: (context) =>
      SupportedCurrenciesFeatureScreen(),
};
