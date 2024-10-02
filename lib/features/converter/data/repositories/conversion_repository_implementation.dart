import 'package:dartz/dartz.dart';

import '../../../../core/failures.dart';
import '../../domain/entities/conversion _rate.dart';
import '../data_sources/remote/remote_conversion_rate_data_source.dart';
import 'conversion_repository.dart';

class ConversionRepositoryImpl implements ConversionRepository {
  final RemoteConversionDataSource remoteDataSource;

  ConversionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ConversionRate>> getConversionRate(String fromCurrency, String toCurrency) async {
    try {
      final conversionRate = await remoteDataSource.fetchConversionRate(fromCurrency, toCurrency);
      return Right(conversionRate);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch conversion rate'));
    }
  }
}
