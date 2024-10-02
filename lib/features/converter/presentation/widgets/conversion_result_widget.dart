import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/bloc/conversion_bloc.dart';
import '../manager/bloc/conversion_state.dart';

class ConversionResult extends StatelessWidget {
  final TextEditingController amountController;
  final String fromCurrency;
  final String toCurrency;

  const ConversionResult({Key? key, required this.amountController, required this.fromCurrency, required this.toCurrency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 5,
      child: BlocBuilder<ConversionBloc, ConversionState>(
        builder: (context, state) {
          if (state is ConversionLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ConversionLoaded) {
            final amountText = amountController.text;
            if (amountText.isNotEmpty && double.tryParse(amountText) != null) {
              final amount = double.parse(amountText);
              final convertedAmount = amount * state.conversionRate.rate;
              return Text(
                '$amount $fromCurrency = $convertedAmount $toCurrency',
                textAlign: TextAlign.center,
              );
            } else {
              return SizedBox();
            }
          } else if (state is ConversionError) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}
