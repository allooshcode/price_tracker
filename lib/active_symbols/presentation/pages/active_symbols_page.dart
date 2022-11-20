import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/active_symbols/presentation/controller/symblols_events.dart';
import 'package:price_tracker/active_symbols/presentation/controller/symbol_bloc.dart';
import 'package:price_tracker/active_symbols/presentation/controller/symbolys_states.dart';
import 'package:price_tracker/core/utils/enums.dart';
import 'package:price_tracker/dependancy_injection.dart';

class ActiveSymbolsPage extends StatelessWidget {
  const ActiveSymbolsPage([Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            SymbolBloc(active: sl())..add(SymbolsEvents()),
        child: BlocBuilder<SymbolBloc, SymbolsStates>(
            buildWhen: (previosState, currentState) =>
                previosState != currentState,
            builder: (context, state) {
              switch (state.sybbolState) {
                case RequestState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case RequestState.loaded:
                  return Column(
                    children: const [Text(" ")],
                  );
                case RequestState.errore:
                  return Center(child: Text(state.errorMsg));
              }
            }));
  }
}
