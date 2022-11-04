import 'package:price_tracker/active_symbols/domain/entities/active_symbol.dart';

class ActiveSymbolModel extends ActivSymbol {
  const ActiveSymbolModel({required this.symbol}) : super(symbole: symbol);
  final String symbol;

  factory ActiveSymbolModel.fromJson(Map<String, dynamic> json) {
    return ActiveSymbolModel(symbol: json['active']);
  }
}
