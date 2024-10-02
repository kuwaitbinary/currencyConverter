import 'package:dartz/dartz.dart';
import 'package:code_challenge/features/supported_currencies/domain/entities/currency.dart';
import 'package:code_challenge/features/supported_currencies/domain/repositories/currency_repository.dart';
import 'package:code_challenge/features/supported_currencies/data/remote/data_sources/remote_currency_data_source.dart';
import 'package:code_challenge/features/supported_currencies/data/local/data_sources/local_currency_data_source.dart';
import '../../../../core/failures.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final RemoteCurrencyDataSource remoteDataSource;
  final LocalCurrencyDataSource localDataSource;

  CurrencyRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Currency>>> getSupportedCurrencies() async {
    try {
      final remoteCurrencies = await remoteDataSource.fetchCurrencies();
      await localDataSource.cacheCurrencies(remoteCurrencies);
      return Right(remoteCurrencies);
    } catch (e) {
      try {
        final localCurrencies = await localDataSource.getLastCurrencies();
        if (localCurrencies.isNotEmpty) {
          return Right(localCurrencies);
        } else {
          return Left(CacheFailure('No cached data available'));
        }
      } catch (e) {
        return Left(CacheFailure('Failed to fetch supported currencies'));
      }
    }
  }
}
