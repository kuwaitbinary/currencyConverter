import 'package:bloc/bloc.dart';
import 'package:code_challenge/features/converter/domain/use_cases/get_conversion_rate.dart';

import 'conversion_event.dart';
import 'conversion_state.dart';

class ConversionBloc extends Bloc<ConversionEvent, ConversionState> {
  final GetConversionRate getConversionRate;

  ConversionBloc({required this.getConversionRate}) : super(ConversionInitial()) {
    on<GetConversionRateEvent>(_onGetConversionRate);
  }

  Future<void> _onGetConversionRate(
      GetConversionRateEvent event,
      Emitter<ConversionState> emit,
      ) async {
    emit(ConversionLoading());
    final result = await getConversionRate(event.fromCurrency, event.toCurrency);
    result.fold(
          (failure) => emit(ConversionError(failure.message)),
          (conversionRate) => emit(ConversionLoaded(conversionRate)),
    );
  }
}
