import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/bloc/historical_data_bloc.dart';
import '../manager/bloc/historical_data_states.dart';
import 'currencies_historical_data_view.dart';
class HistoricalDataBlocBuilder extends StatelessWidget {
  final String currencyPair1;
  final String currencyPair2;

  const HistoricalDataBlocBuilder({Key? key, required this.currencyPair1, required this.currencyPair2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoricalDataBloc, HistoricalDataState>(
      builder: (context, state) {
        if (state is HistoricalDataLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HistoricalDataLoaded) {
          final dataPair1 = state.historicalData[currencyPair1] ?? [];
          final dataPair2 = state.historicalData[currencyPair2] ?? [];

          if (dataPair1.isEmpty && dataPair2.isEmpty) {
            return Center(child: Text('No historical data found'));
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                HistoricalDataView(currencyPair: currencyPair1, historicalData: dataPair1),
                SizedBox(width: 16),
                HistoricalDataView(currencyPair: currencyPair2, historicalData: dataPair2),
              ],
            ),
          );
        } else if (state is HistoricalDataError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('No historical data found'));
        }
      },
    );
  }
}
