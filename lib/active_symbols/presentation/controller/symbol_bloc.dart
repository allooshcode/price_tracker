import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:price_tracker/active_symbols/domain/usecases/get_active_symbols_usecase.dart';
import 'package:price_tracker/active_symbols/presentation/controller/symblols_events.dart';
import 'package:price_tracker/active_symbols/presentation/controller/symbolys_states.dart';
import 'package:price_tracker/core/usecase/usecase.dart';
import 'package:price_tracker/core/utils/enums.dart';

// ignore: must_be_immutable
class SymbolBloc extends Bloc<SymbolsEvent, SymbolsStates>
    implements Equatable {
  final GetActiveSymbolUsecase getActiveSymbolUsecase;

  SymbolBloc({required GetActiveSymbolUsecase active})
      : getActiveSymbolUsecase = active,
        super(const SymbolsStates()) {
    // final ActiveSymbolDataRemoteSourceBase activeSymbolDataRemoteSourceBase =
    //     ActiveSymbolDataRemoteSource();

    // final ActiveSymbolRepositorybase activeSymbolRepositorybase =
    //     ActiveSymbolsDataRepository(
    //         activeSymbolsDataSource: activeSymbolDataRemoteSourceBase);
    // getActiveSymbolUsecase.call(const NoParam());

    // ignore: unused_element
    on<SymbolsEvents>(_symbolEvent);
  }

  Future _symbolEvent(SymbolsEvent event, Emitter<SymbolsStates> emit) async {
    emit(const SymbolsStates(sybbolState: RequestState.loading));
    debugPrint('symbole event run ....');
    final response = await getActiveSymbolUsecase(const NoParam());
    response.fold(
        (err) => emit(SymbolsStates(
            sybbolState: RequestState.errore, errorMsg: err.msgError)),
        (listOfSymbols) => emit(SymbolsStates(
            activeSymbols: listOfSymbols, sybbolState: RequestState.loaded)));
  }

  @override
  List<Object?> get props => [getActiveSymbolUsecase];

  @override
  bool? get stringify => throw UnimplementedError();
}
