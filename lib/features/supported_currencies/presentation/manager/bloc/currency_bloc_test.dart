// test/features/supported_currencies/presentation/manager/currency_bloc_test.dart
import 'package:bloc_test/bloc_test.dart';
import 'package:code_challenge/features/supported_currencies/domain/use_cases/get_currencies.dart';
import 'package:code_challenge/features/supported_currencies/presentation/manager/bloc/currency_bloc.dart';
import 'package:code_challenge/features/supported_currencies/presentation/manager/bloc/currency_event.dart';
import 'package:code_challenge/features/supported_currencies/presentation/manager/bloc/currency_state.dart';
import 'package:code_challenge/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/entities/currency.dart';

class MockGetCurrencies extends Mock implements GetCurrencies {}

void main() {
  late CurrencyBloc bloc;
  late MockGetCurrencies mockGetCurrencies;

  setUp(() {
    mockGetCurrencies = MockGetCurrencies();
    bloc = CurrencyBloc(getCurrencies: mockGetCurrencies);
  });

  final tCurrencyList = [
    Currency(code: 'USD', name: 'United States Dollar'),
    Currency(code: 'EUR', name: 'Euro'),
  ];

  test('initial state should be CurrencyInitial', () {
    // Assert
    expect(bloc.state, equals(CurrencyInitial()));
  });

  blocTest<CurrencyBloc, CurrencyState>(
    'should emit [CurrencyLoading, CurrencyLoaded] when data is gotten successfully',
    build: () {
      when(mockGetCurrencies()).thenAnswer((_) async => Right(tCurrencyList));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadSupportedCurrenciesEvent()),
    expect: () => [CurrencyLoading(), CurrencyLoaded(currencies: tCurrencyList)],
    verify: (bloc) {
      verify(mockGetCurrencies());
    },
  );

  blocTest<CurrencyBloc, CurrencyState>(
    'should emit [CurrencyLoading, CurrencyError] when getting data fails',
    build: () {
      when(mockGetCurrencies()).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadSupportedCurrenciesEvent()),
    expect: () => [CurrencyLoading(), CurrencyError(message: 'Server Failure')],
    verify: (bloc) {
      verify(mockGetCurrencies());
    },
  );
}
