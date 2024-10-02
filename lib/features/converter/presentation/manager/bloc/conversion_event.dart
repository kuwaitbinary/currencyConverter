import 'package:equatable/equatable.dart';

abstract class ConversionEvent extends Equatable {
  const ConversionEvent();

  @override
  List<Object> get props => [];
}

class GetConversionRateEvent extends ConversionEvent {
  final String fromCurrency;
  final String toCurrency;

  const GetConversionRateEvent(this.fromCurrency, this.toCurrency);

  @override
  List<Object> get props => [fromCurrency, toCurrency];
}
