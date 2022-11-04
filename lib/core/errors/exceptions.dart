import 'package:price_tracker/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel? messageModel;

  ServerException([this.messageModel]);
}
