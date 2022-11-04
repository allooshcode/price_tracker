import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/active_symbols/domain/usecases/get_active_symbols_usecase.dart';
import 'package:price_tracker/active_symbols/presentation/controller/symblols_events.dart';
import 'package:price_tracker/active_symbols/presentation/controller/symbolys_states.dart';
import 'package:price_tracker/core/utils/enums.dart';

class SymbolBloc extends Bloc<SymbolsEvent, SymbolsStates> {
  final GetActiveSymbolUsecase getActiveSymbolUsecase;

  SymbolBloc({required this.getActiveSymbolUsecase})
      : super(const SymbolsStates()) {
    on<SymbolsEvents>(event, emit) async {
      debugPrint('symbole event run ....');
      final response = await getActiveSymbolUsecase();
      response.fold(
          (err) => emit(SymbolsStates(
              sybbolState: RequestState.errore, errorMsg: err.msgError)),
          (listOfSymbols) => emit(SymbolsStates(
              activeSymbols: listOfSymbols, sybbolState: RequestState.loaded)));
    }
  }
}
