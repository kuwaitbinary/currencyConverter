import 'package:equatable/equatable.dart';

class ConversionRate extends Equatable {
  final String fromCurrency;
  final String toCurrency;
  final double rate;

  ConversionRate({
    required this.fromCurrency,
    required this.toCurrency,
    required this.rate,
  });

  @override
  List<Object?> get props => [fromCurrency, toCurrency, rate];
}
