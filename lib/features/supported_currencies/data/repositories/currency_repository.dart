import 'package:code_challenge/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:code_challenge/features/supported_currencies/domain/entities/currency.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, List<Currency>>> getSupportedCurrencies();
}
