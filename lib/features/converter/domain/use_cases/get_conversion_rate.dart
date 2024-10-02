import 'package:dartz/dartz.dart';

import '../../../../core/failures.dart';
import '../../data/repositories/conversion_repository.dart';
import '../entities/conversion _rate.dart';

class GetConversionRate {
  final ConversionRepository repository;

  GetConversionRate(this.repository);

  Future<Either<Failure, ConversionRate>> call(
      String fromCurrency, String toCurrency) {
    return repository.getConversionRate(fromCurrency, toCurrency);
  }
}
