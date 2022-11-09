import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  const ErrorMessageModel({required this.msg});
  final String msg;

  @override
  List<Object?> get props => [msg];

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(msg: json['error_message']);
  }
}
