import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/get_currencies.dart';
import '../manager/bloc/currency_bloc.dart';
import '../widgets/suppoerted_currencies_view.dart';

class SupportedCurrenciesFeatureScreen extends StatelessWidget {
  const SupportedCurrenciesFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supported Currencies'),
      ),
      body: BlocProvider(
        create: (context) => CurrencyBloc(
          getCurrencies: context.read<GetCurrencies>(),
        ),
        child: SupportedCurrenciesView(),
      ),
    );
  }
}
