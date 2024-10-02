import 'package:flutter/material.dart';
import 'package:code_challenge/currency_converter_app.dart';
import 'package:code_challenge/core/injection.dart' as dependencyInjection;
import 'package:provider/provider.dart';
import 'package:code_challenge/features/supported_currencies/domain/use_cases/get_currencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dependencyInjection.init();
  runApp(
    const CurrencyConverterApp(),
  );
}
