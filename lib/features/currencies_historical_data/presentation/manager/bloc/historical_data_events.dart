import 'package:equatable/equatable.dart';

abstract class HistoricalDataEvent extends Equatable {
  const HistoricalDataEvent();

  @override
  List<Object> get props => [];
}

class GetHistoricalDataEvent extends HistoricalDataEvent {
  final String currencyPair1;
  final String currencyPair2;

  const GetHistoricalDataEvent(this.currencyPair1, this.currencyPair2);

  @override
  List<Object> get props => [currencyPair1, currencyPair2];
}
