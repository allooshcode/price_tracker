import 'package:dio/dio.dart';
import 'package:price_tracker/active_symbols/data/models/active_symbols_model.dart';
import 'package:price_tracker/core/errors/exceptions.dart';
import 'package:price_tracker/core/network/api_constants.dart';
import 'package:price_tracker/core/network/error_message_model.dart';

abstract class ActiveSymbolDataRemoteSourceBase {
  Future<List<ActiveSymbolModel>> getActiveSymbols();
}

class ActiveSymbolDataRemoteSource extends ActiveSymbolDataRemoteSourceBase {
  @override
  Future<List<ActiveSymbolModel>> getActiveSymbols() async {
    final result = await Dio().get(ApiConstants.activeSymboleUrl);
    if (result.statusCode == 200) {
      return List.from((result.data["active_symbols"] as List)
          .map((e) => ActiveSymbolModel.fromJson(e)));
    } else {
      throw ServerException(const ErrorMessageModel(msg: 'server error'));
    }
  }
}
