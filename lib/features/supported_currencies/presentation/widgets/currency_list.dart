import 'package:flutter/material.dart';
import '../../domain/entities/currency.dart';
import 'currency_list_tile.dart';

class CurrencyList extends StatelessWidget {
  final List<Currency> currencies;

  const CurrencyList({Key? key, required this.currencies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currencies.length,
      itemBuilder: (context, index) {
        return CurrencyListTile(currency: currencies[index]);
      },
    );
  }
}
