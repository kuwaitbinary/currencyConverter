import 'package:code_challenge/features/converter/data/data_sources/remote/remote_conversion_rate_data_source.dart';
import 'package:code_challenge/features/converter/data/repositories/conversion_repository.dart';
import 'package:code_challenge/features/converter/domain/use_cases/get_conversion_rate.dart';
import 'package:code_challenge/features/converter/presentation/manager/bloc/conversion_bloc.dart';
import 'package:code_challenge/features/currencies_historical_data/domain/use_cases/get_historical_data.dart';
import 'package:code_challenge/features/currencies_historical_data/presentation/manager/bloc/historical_data_bloc.dart';
import 'package:code_challenge/features/supported_currencies/data/local/data_sources/local_currency_data_source.dart';
import 'package:code_challenge/features/supported_currencies/data/remote/data_sources/remote_currency_data_source.dart';
import 'package:code_challenge/features/supported_currencies/domain/repositories/currency_repository.dart';
import 'package:code_challenge/features/supported_currencies/domain/use_cases/get_currencies.dart';
import 'package:code_challenge/features/supported_currencies/presentation/manager/bloc/currency_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../features/converter/data/repositories/conversion_repository_implementation.dart';
import '../features/currencies_historical_data/data/data_sources/remote/data_source/remote_historical_data_source.dart';
import '../features/currencies_historical_data/data/repositories/historical _data_repository.dart';
import '../features/currencies_historical_data/data/repositories/historical_data_repository_implementation.dart';
import '../features/supported_currencies/data/repositories/currency_repository_implementation.dart';

final sl = GetIt.instance;

void init() {
  // External
  sl.registerLazySingleton(() => http.Client());

  // Data sources
  sl.registerLazySingleton(() => RemoteConversionDataSource(sl()));
  sl.registerLazySingleton(() => RemoteHistoricalDataSource(sl()));
  sl.registerLazySingleton(() => RemoteCurrencyDataSource(sl()));
  sl.registerLazySingleton(() => LocalCurrencyDataSource());

  // Repository
  sl.registerLazySingleton<ConversionRepository>(() => ConversionRepositoryImpl(
    remoteDataSource: sl(),
  ));
  sl.registerLazySingleton<HistoricalDataRepository>(() => HistoricalDataRepositoryImpl(
    remoteDataSource: sl(),
  ));
  sl.registerLazySingleton<CurrencyRepository>(() => CurrencyRepositoryImpl(
    remoteDataSource: sl(),
    localDataSource: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => GetConversionRate(sl<ConversionRepository>()));
  sl.registerLazySingleton(() => GetHistoricalData(sl<HistoricalDataRepository>()));
  sl.registerLazySingleton(() => GetCurrencies(sl<CurrencyRepository>()));

  // Blocs
  sl.registerFactory(() => ConversionBloc(getConversionRate: sl<GetConversionRate>()));
  sl.registerFactory(() => HistoricalDataBloc(getHistoricalData: sl<GetHistoricalData>()));
  sl.registerFactory(() => CurrencyBloc(getCurrencies: sl<GetCurrencies>()));
}
