import 'package:bloc/bloc.dart';
import 'package:code_challenge/features/supported_currencies/domain/use_cases/get_currencies.dart';
import 'package:code_challenge/features/supported_currencies/presentation/manager/bloc/currency_event.dart';
import 'package:code_challenge/features/supported_currencies/presentation/manager/bloc/currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final GetCurrencies getCurrencies;

  CurrencyBloc({required this.getCurrencies}) : super(CurrencyInitial()) {
    on<LoadSupportedCurrenciesEvent>(_onLoadSupportedCurrencies);
  }

  Future<void> _onLoadSupportedCurrencies(
      LoadSupportedCurrenciesEvent event,
      Emitter<CurrencyState> emit,
      ) async {
    emit(CurrencyLoading());
    final result = await getCurrencies();
    result.fold(
          (failure) => emit(CurrencyError(message: failure.message)),
          (currencies) => emit(CurrencyLoaded(currencies: currencies)),
    );
  }
}
