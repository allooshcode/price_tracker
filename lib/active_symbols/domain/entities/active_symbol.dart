import 'package:equatable/equatable.dart';

class ActivSymbol extends Equatable {
  final String symbole;
  const ActivSymbol({required this.symbole});

  @override
  List<Object?> get props => [symbole];
}
