import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/bloc/currency_bloc.dart';
import '../manager/bloc/currency_event.dart';
import '../manager/bloc/currency_state.dart';
import 'currency_list.dart';

class SupportedCurrenciesView extends StatefulWidget {
  @override
  _SupportedCurrenciesViewState createState() => _SupportedCurrenciesViewState();
}

class _SupportedCurrenciesViewState extends State<SupportedCurrenciesView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<CurrencyBloc>().add(LoadSupportedCurrenciesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        if (state is CurrencyLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CurrencyLoaded) {
          return CurrencyList(currencies: state.currencies);
        } else if (state is CurrencyError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('No supported currencies found'));
        }
      },
    );
  }
}
