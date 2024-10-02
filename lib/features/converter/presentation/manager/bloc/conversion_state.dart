import 'package:equatable/equatable.dart';

import '../../../domain/entities/conversion _rate.dart';

abstract class ConversionState extends Equatable {
  const ConversionState();

  @override
  List<Object> get props => [];
}

class ConversionInitial extends ConversionState {}

class ConversionLoading extends ConversionState {}

class ConversionLoaded extends ConversionState {
  final ConversionRate conversionRate;

  const ConversionLoaded(this.conversionRate);

  @override
  List<Object> get props => [conversionRate];
}

class ConversionError extends ConversionState {
  final String message;

  const ConversionError(this.message);

  @override
  List<Object> get props => [message];
}
