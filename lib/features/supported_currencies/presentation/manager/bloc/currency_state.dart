import 'package:equatable/equatable.dart';
import 'package:code_challenge/features/supported_currencies/domain/entities/currency.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

class CurrencyInitial extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencyLoaded extends CurrencyState {
  final List<Currency> currencies;

  CurrencyLoaded({required this.currencies});

  @override
  List<Object> get props => [currencies];
}

class CurrencyError extends CurrencyState {
  final String message;

  CurrencyError({required this.message});

  @override
  List<Object> get props => [message];
}
