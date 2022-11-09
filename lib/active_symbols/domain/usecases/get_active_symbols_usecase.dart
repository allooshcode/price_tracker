import 'package:dartz/dartz.dart';
import 'package:price_tracker/active_symbols/domain/entities/active_symbol.dart';
import 'package:price_tracker/active_symbols/domain/repository/get_active_symbols_repository.dart';
import 'package:price_tracker/core/errors/failures.dart';
import 'package:price_tracker/core/usecase/usecase.dart';

class GetActiveSymbolUsecase extends UseCase<List<ActivSymbol>, NoParam> {
  GetActiveSymbolUsecase({required this.activeSymbolRepository});

  final ActiveSymbolRepositorybase activeSymbolRepository;

  @override
  Future<Either<Failure, List<ActivSymbol>>> call(NoParam param) async {
    return await activeSymbolRepository.getActiveSymbolRepository();
  }
}
