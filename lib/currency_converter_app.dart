import 'package:code_challenge/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/injection.dart';
import 'features/converter/presentation/manager/bloc/conversion_bloc.dart';
import 'features/currencies_historical_data/domain/use_cases/get_historical_data.dart';
import 'features/supported_currencies/domain/use_cases/get_currencies.dart';
import 'features/supported_currencies/presentation/manager/bloc/currency_bloc.dart';
import 'features/currencies_historical_data/presentation/manager/bloc/historical_data_bloc.dart';

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GetHistoricalData>(
          create: (_) => sl<GetHistoricalData>(),
        ),
        Provider<GetCurrencies>(
          create: (_) => sl<GetCurrencies>(),
        ),
        BlocProvider<CurrencyBloc>(
          create: (_) => CurrencyBloc(getCurrencies: sl<GetCurrencies>()),
        ),
        BlocProvider<ConversionBloc>(
          create: (_) => sl<ConversionBloc>(),
        ),
        BlocProvider<HistoricalDataBloc>(
          create: (_) => sl<HistoricalDataBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        initialRoute: AppRoutes.initialRoute,
        onGenerateRoute: AppRoutes.generateRoute,
        theme: appTheme(),
      ),
    );
  }
}
