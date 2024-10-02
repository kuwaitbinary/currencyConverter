import 'package:flutter/material.dart';

import '../../domain/entities/currenciesHistoricalDataModel.dart';

class HistoricalDataView extends StatelessWidget {
  final String currencyPair;
  final List<HistoricalData> historicalData;

  const HistoricalDataView({Key? key, required this.currencyPair, required this.historicalData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(currencyPair, style: TextStyle(fontWeight: FontWeight.bold)),
          ...historicalData.map((data) => ListTile(
            title: Text(data.date),
            subtitle: Text(data.rate.toString()),
          )).toList(),
        ],
      ),
    );
  }
}
