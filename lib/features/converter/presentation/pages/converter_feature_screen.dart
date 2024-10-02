import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/bloc/conversion_bloc.dart';
import '../manager/bloc/conversion_event.dart';
import '../widgets/amount_input.dart';
import '../widgets/conversion_button.dart';
import '../widgets/conversion_result_widget.dart';
import '../widgets/currency_dropdown.dart';

class ConverterFeatureScreen extends StatefulWidget {
  @override
  _ConverterFeatureScreenState createState() => _ConverterFeatureScreenState();
}

class _ConverterFeatureScreenState extends State<ConverterFeatureScreen> {
  final TextEditingController _amountController = TextEditingController();
  String _fromCurrency = 'USD';
  String _toCurrency = 'EUR';

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _onConvert() {
    if (_amountController.text.isEmpty ||
        double.tryParse(_amountController.text) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid amount')),
      );
    } else {
      BlocProvider.of<ConversionBloc>(context).add(
        GetConversionRateEvent(_fromCurrency, _toCurrency),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AmountInput(controller: _amountController),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CurrencyDropdown(
                  value: _fromCurrency,
                  onChanged: (value) {
                    setState(() {
                      _fromCurrency = value!;
                    });
                  },
                ),
                SizedBox(width: 50),
                CurrencyDropdown(
                  value: _toCurrency,
                  onChanged: (value) {
                    setState(() {
                      _toCurrency = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ConversionButton(onTap: _onConvert),
            SizedBox(height: 16.0),
            ConversionResult(
              amountController: _amountController,
              fromCurrency: _fromCurrency,
              toCurrency: _toCurrency,
            ),
          ],
        ),
      ),
    );
  }
}
