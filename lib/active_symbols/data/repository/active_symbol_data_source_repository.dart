import 'package:price_tracker/active_symbols/data/data_sources/active_symbols_remote_source.dart';
import 'package:price_tracker/active_symbols/domain/entities/active_symbol.dart';
import 'package:dartz/dartz.dart';
import 'package:price_tracker/active_symbols/domain/repository/get_active_symbols_repository.dart';
import 'package:price_tracker/core/errors/exceptions.dart';
import 'package:price_tracker/core/errors/failures.dart';

class ActiveSymbolsDataRepository extends ActiveSymbolRepositorybase {
  final ActiveSymbolDataRemoteSourceBase activeSymbolsDataSource;
  ActiveSymbolsDataRepository({required this.activeSymbolsDataSource});

  @override
  Future<Either<Failure, List<ActivSymbol>>> getActiveSymbolRepository() async {
    try {
      return right(await activeSymbolsDataSource.getActiveSymbols());
    } on ServerException catch (err) {
      return left(ServerFailure(err.messageModel!.msg));
    }
  }
}
