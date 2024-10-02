import 'package:equatable/equatable.dart';

import '../../../domain/entities/currenciesHistoricalDataModel.dart';

abstract class HistoricalDataState extends Equatable {
  const HistoricalDataState();

  @override
  List<Object> get props => [];
}

class HistoricalDataInitial extends HistoricalDataState {}

class HistoricalDataLoading extends HistoricalDataState {}

class HistoricalDataLoaded extends HistoricalDataState {
  final Map<String, List<HistoricalData>> historicalData;

  const HistoricalDataLoaded({required this.historicalData});

  @override
  List<Object> get props => [historicalData];
}

class HistoricalDataError extends HistoricalDataState {
  final String message;

  const HistoricalDataError({required this.message});

  @override
  List<Object> get props => [message];
}
