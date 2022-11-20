import 'package:get_it/get_it.dart';
import 'package:price_tracker/active_symbols/data/data_sources/active_symbols_remote_source.dart';
import 'package:price_tracker/active_symbols/data/repository/active_symbol_data_source_repository.dart';
import 'package:price_tracker/active_symbols/domain/repository/get_active_symbols_repository.dart';
import 'package:price_tracker/active_symbols/domain/usecases/get_active_symbols_usecase.dart';
import 'package:price_tracker/active_symbols/presentation/controller/symbol_bloc.dart';
import 'package:price_tracker/core/usecase/usecase.dart';

final sl = GetIt.I;

Future<void> inti() async {
//blocs

  sl.registerFactory(() => SymbolBloc(active: sl()));

  //data

  sl.registerLazySingleton<ActiveSymbolDataRemoteSourceBase>(
      () => ActiveSymbolDataRemoteSource());

  //domain

  sl.registerLazySingleton<ActiveSymbolRepositorybase>(
      () => ActiveSymbolsDataRepository(activeSymbolsDataSource: sl()));

  //Usecases

  sl.registerLazySingleton<UseCase>(
      () => GetActiveSymbolUsecase(activeSymbolRepository: sl()));
}
