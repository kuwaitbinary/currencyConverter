import 'package:code_challenge/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:code_challenge/features/converter/presentation/widgets/converter_screen_button.dart';
import 'package:code_challenge/features/currencies_historical_data/presentation/widgets/currencies_historical_data_screen_button.dart';
import 'package:code_challenge/features/supported_currencies/presentation/widgets/supported_currencies_screen_button.dart';

class CurrencyConverterHomeScreen extends StatefulWidget {
  const CurrencyConverterHomeScreen({super.key});

  @override
  State<CurrencyConverterHomeScreen> createState() =>
      _CurrencyConverterHomeScreenState();
}

class _CurrencyConverterHomeScreenState
    extends State<CurrencyConverterHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text(AppStrings.appName)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConverterScreenButton(),
            CurrenciesHistoricalDataScreenButton(),
            SupportedCurrenciesScreenButton(),
          ],
        ),
      ),
    );
  }
}
