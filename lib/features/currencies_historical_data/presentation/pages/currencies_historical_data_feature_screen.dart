import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/bloc/historical_data_bloc.dart';
import '../manager/bloc/historical_data_events.dart';
import '../widgets/currencies_historical_data_bloc_builder.dart';

class CurrenciesHistoricalDataFeatureScreen extends StatelessWidget {
  final String currencyPair1;
  final String currencyPair2;

  const CurrenciesHistoricalDataFeatureScreen({
    required this.currencyPair1,
    required this.currencyPair2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currencies Historical Data'),
        automaticallyImplyLeading: true,
      ),
      body: BlocProvider.value(
        value: BlocProvider.of<HistoricalDataBloc>(context),
        child: CurrenciesHistoricalDataView(
          currencyPair1: currencyPair1,
          currencyPair2: currencyPair2,
        ),
      ),
    );
  }
}

class CurrenciesHistoricalDataView extends StatefulWidget {
  final String currencyPair1;
  final String currencyPair2;

  const CurrenciesHistoricalDataView({
    required this.currencyPair1,
    required this.currencyPair2,
    super.key,
  });

  @override
  _CurrenciesHistoricalDataViewState createState() =>
      _CurrenciesHistoricalDataViewState();
}

class _CurrenciesHistoricalDataViewState extends State<CurrenciesHistoricalDataView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<HistoricalDataBloc>().add(
        GetHistoricalDataEvent(widget.currencyPair1, widget.currencyPair2));
  }

  @override
  Widget build(BuildContext context) {
    return HistoricalDataBlocBuilder(
      currencyPair1: widget.currencyPair1,
      currencyPair2: widget.currencyPair2,
    );
  }
}
