import 'package:bloc/bloc.dart';
import 'package:code_challenge/core/failures.dart';
import 'package:code_challenge/features/currencies_historical_data/domain/use_cases/get_historical_data.dart';
import 'package:code_challenge/features/currencies_historical_data/presentation/manager/bloc/historical_data_events.dart';

import 'historical_data_states.dart';

class HistoricalDataBloc extends Bloc<HistoricalDataEvent, HistoricalDataState> {
  final GetHistoricalData getHistoricalData;

  HistoricalDataBloc({required this.getHistoricalData}) : super(HistoricalDataInitial()) {
    on<GetHistoricalDataEvent>(_onGetHistoricalData);
  }

  Future<void> _onGetHistoricalData(
      GetHistoricalDataEvent event,
      Emitter<HistoricalDataState> emit,
      ) async {
    emit(HistoricalDataLoading());
    final failureOrData = await getHistoricalData(event.currencyPair1, event.currencyPair2);
    failureOrData.fold(
          (failure) {
        print("Failed to fetch historical data: ${failure.message}");
        emit(HistoricalDataError(message: _mapFailureToMessage(failure)));
      },
          (data) {
        print("Emitting loaded data: $data");
        emit(HistoricalDataLoaded(historicalData: data));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return 'An error occurred';
  }
}
