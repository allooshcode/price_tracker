import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  const ErrorMessageModel({required this.msg});
  final String msg;

  @override
  List<Object?> get props => [msg];
}
