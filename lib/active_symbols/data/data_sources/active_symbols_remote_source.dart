import 'package:price_tracker/active_symbols/data/models/active_symbols_model.dart';

abstract class ActiveSymbolDataRemoteSourceBase {
  Future<ActiveSymbolModel> getActiveSymbols();
}

class ActiveSymbolDataRemoteSource extends ActiveSymbolDataRemoteSourceBase {
  @override
  Future<ActiveSymbolModel> getActiveSymbols() async {

    Dio().
  }
}
