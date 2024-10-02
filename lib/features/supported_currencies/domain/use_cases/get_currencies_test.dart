import 'package:code_challenge/features/supported_currencies/domain/entities/currency.dart';
import 'package:code_challenge/features/supported_currencies/domain/repositories/currency_repository.dart';
import 'package:code_challenge/features/supported_currencies/domain/use_cases/get_currencies.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCurrencyRepository extends Mock implements CurrencyRepository {}

void main() {
  late GetCurrencies usecase;
  late MockCurrencyRepository mockCurrencyRepository;

  setUp(() {
    mockCurrencyRepository = MockCurrencyRepository();
    usecase = GetCurrencies(mockCurrencyRepository);
  });

  final tCurrencyList = [
    Currency(code: 'USD', name: 'United States Dollar'),
    Currency(code: 'EUR', name: 'Euro'),
  ];

  test('should get list of currencies from the repository', () async {
    // Arrange
    when(mockCurrencyRepository.getSupportedCurrencies())
        .thenAnswer((_) async => Right(tCurrencyList));

    // Act
    final result = await usecase();

    // Assert
    expect(result, Right(tCurrencyList));
    verify(mockCurrencyRepository.getSupportedCurrencies());
    verifyNoMoreInteractions(mockCurrencyRepository);
  });
}
