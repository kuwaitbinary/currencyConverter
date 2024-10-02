import 'package:dartz/dartz.dart';
import 'package:code_challenge/core/failures.dart';

import '../../domain/entities/currenciesHistoricalDataModel.dart';

abstract class HistoricalDataRepository {
  Future<Either<Failure, Map<String, List<HistoricalData>>>> getHistoricalData(String currencyPair1, String currencyPair2);
}
