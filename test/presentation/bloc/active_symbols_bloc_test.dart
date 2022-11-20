import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:price_tracker/active_symbols/data/data_sources/active_symbols_remote_source.dart';
import 'package:price_tracker/active_symbols/domain/usecases/get_active_symbols_usecase.dart';
import 'package:price_tracker/active_symbols/presentation/controller/symblols_events.dart';
import 'package:price_tracker/active_symbols/presentation/controller/symbol_bloc.dart';
import 'package:price_tracker/active_symbols/presentation/controller/symbolys_states.dart';
import 'package:price_tracker/core/errors/failures.dart';
import 'package:price_tracker/core/usecase/usecase.dart';
import 'package:price_tracker/core/utils/enums.dart';

import '../../active_symbols/data/data_sources/active_symbols_remote_source_test.mocks.dart';
import '../../active_symbols/domain/repository/get_active_symbols_repository_test.mocks.dart';
import '../../active_symbols/domain/usecases/get_active_symbols_usecase_test.mocks.dart';

void main() {
  late SymbolBloc bloc;
  late GetActiveSymbolUsecase mockGetActive;
  late ActiveSymbolDataRemoteSourceBase mockActiveData;
  late MockActiveSymbolRepositorybase mockActiveRepository;
  late GetIt sl;

  // setUp(() {
  //   mockGetActive = MockGetActive();

  //   bloc = SymbolBloc(active: mockGetActive);
  // });

  // test('initial state', () {
  //   expect(bloc.state, [const SymbolsStates()]);
  // });
  setUp(() {
    mockGetActive = MockGetActiveSymbolUsecase();
    mockActiveData = MockActiveSymbolDataRemoteSourceBase();
    mockActiveRepository = MockActiveSymbolRepositorybase();

    sl = GetIt.I;
    sl.registerSingleton(mockActiveData);
    sl.registerSingleton(mockActiveRepository);
    sl.registerSingleton(mockGetActive);

    bloc = SymbolBloc(active: sl());
  });

  test('got error fetching data', () async {
    //arrange

    final expected = [
      const SymbolsStates(sybbolState: RequestState.loading),
      const SymbolsStates(
          errorMsg: 'Error getting data', sybbolState: RequestState.errore)
    ];

    when(mockActiveData.getActiveSymbols())
        .thenAnswer((_) async => throw Exception());
    when(mockActiveRepository.getActiveSymbolRepository()).thenAnswer(
        (_) async => const Left(ServerFailure('Error getting data')));

    when(mockGetActive(const NoParam())).thenAnswer(
        (_) async => const Left(ServerFailure('Error getting data')));

    //assert

    expectLater(bloc.stream, emitsInAnyOrder(expected));

    //act

    bloc.add(SymbolsEvents());
  });
}
