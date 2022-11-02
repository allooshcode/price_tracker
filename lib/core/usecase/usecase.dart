import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:price_tracker/core/errors/failures.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

class NoParam extends Equatable {
  const NoParam();

  @override
  List<Object?> get props => throw UnimplementedError();
}
