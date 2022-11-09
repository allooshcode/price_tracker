import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/active_symbols/data/data_sources/active_symbols_remote_source.dart';
import 'package:price_tracker/active_symbols/data/repository/active_symbol_data_source_repository.dart';
import 'package:price_tracker/active_symbols/domain/repository/get_active_symbols_repository.dart';
import 'package:price_tracker/active_symbols/domain/usecases/get_active_symbols_usecase.dart';
import 'package:price_tracker/active_symbols/presentation/controller/symblols_events.dart';
import 'package:price_tracker/active_symbols/presentation/controller/symbolys_states.dart';
import 'package:price_tracker/core/usecase/usecase.dart';
import 'package:price_tracker/core/utils/enums.dart';

class SymbolBloc extends Bloc<SymbolsEvent, SymbolsStates> {
  SymbolBloc() : super(const SymbolsStates()) {
    final ActiveSymbolDataRemoteSourceBase activeSymbolDataRemoteSourceBase =
        ActiveSymbolDataRemoteSource();

    final ActiveSymbolRepositorybase activeSymbolRepositorybase =
        ActiveSymbolsDataRepository(
            activeSymbolsDataSource: activeSymbolDataRemoteSourceBase);
    final GetActiveSymbolUsecase getActiveSymbolUsecase =
        GetActiveSymbolUsecase(
            activeSymbolRepository: activeSymbolRepositorybase);

    on<SymbolsEvents>(event, emit) async {
      debugPrint('symbole event run ....');
      final response = await getActiveSymbolUsecase(const NoParam());
      response.fold(
          (err) => emit(SymbolsStates(
              sybbolState: RequestState.errore, errorMsg: err.msgError)),
          (listOfSymbols) => emit(SymbolsStates(
              activeSymbols: listOfSymbols, sybbolState: RequestState.loaded)));
    }
  }
}
