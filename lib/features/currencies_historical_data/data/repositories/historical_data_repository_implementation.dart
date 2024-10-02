import 'package:dartz/dartz.dart';
import 'package:code_challenge/core/failures.dart';

import '../../domain/entities/currenciesHistoricalDataModel.dart';
import '../data_sources/remote/data_source/remote_historical_data_source.dart';
import 'historical _data_repository.dart';

class HistoricalDataRepositoryImpl implements HistoricalDataRepository {
  final RemoteHistoricalDataSource remoteDataSource;

  HistoricalDataRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Map<String, List<HistoricalData>>>> getHistoricalData(String currencyPair1, String currencyPair2) async {
    try {
      final data = await remoteDataSource.fetchHistoricalData(currencyPair1, currencyPair2);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch historical data'));
    }
  }
}
