import 'package:dartz/dartz.dart';
import 'package:price_tracker/active_symbols/domain/entities/active_symbol.dart';
import 'package:price_tracker/core/errors/failures.dart';

abstract class ActiveSymbolRepositorybase {
  Future<Either<Failure, List<ActivSymbol>>> getActiveSymbolRepository();
}
