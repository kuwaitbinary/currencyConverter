import 'package:code_challenge/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:code_challenge/features/supported_currencies/domain/entities/currency.dart';
import 'package:code_challenge/features/supported_currencies/domain/repositories/currency_repository.dart';

class GetCurrencies {
  final CurrencyRepository repository;

  GetCurrencies(this.repository);

  Future<Either<Failure, List<Currency>>> call() {
    return repository.getSupportedCurrencies();
  }
}
