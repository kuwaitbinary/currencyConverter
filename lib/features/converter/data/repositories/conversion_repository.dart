import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../../domain/entities/conversion _rate.dart';

abstract class ConversionRepository {
  Future<Either<Failure, ConversionRate>> getConversionRate(
      String fromCurrency, String toCurrency);
}
