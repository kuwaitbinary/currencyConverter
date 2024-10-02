import 'package:dartz/dartz.dart';
import 'package:code_challenge/core/failures.dart';

import '../../data/repositories/historical _data_repository.dart';
import '../entities/currenciesHistoricalDataModel.dart';

class GetHistoricalData {
  final HistoricalDataRepository repository;

  GetHistoricalData(this.repository);

  Future<Either<Failure, Map<String, List<HistoricalData>>>> call(
      String currencyPair1, String currencyPair2) {
    return repository.getHistoricalData(currencyPair1, currencyPair2);
  }
}
