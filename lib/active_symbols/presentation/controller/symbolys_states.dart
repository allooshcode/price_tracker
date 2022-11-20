import 'package:equatable/equatable.dart';
import 'package:price_tracker/active_symbols/domain/entities/active_symbol.dart';
import 'package:price_tracker/core/utils/enums.dart';

class SymbolsStates extends Equatable {
  final List<ActivSymbol> activeSymbols;
  final RequestState sybbolState;
  final String errorMsg;

  const SymbolsStates(
      {this.errorMsg = '',
      this.sybbolState = RequestState.loading,
      this.activeSymbols = const []});

  @override
  List<Object?> get props => [activeSymbols, sybbolState, errorMsg];
}
