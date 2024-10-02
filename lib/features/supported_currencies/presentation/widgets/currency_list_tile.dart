import 'package:flutter/material.dart';
import '../../domain/entities/currency.dart';
import 'flag_image.dart';

class CurrencyListTile extends StatelessWidget {
  final Currency currency;

  const CurrencyListTile({Key? key, required this.currency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FlagImage(countryCode: currency.code.substring(0, 2)),
      title: Text('${currency.name} (${currency.code})'),
    );
  }
}
