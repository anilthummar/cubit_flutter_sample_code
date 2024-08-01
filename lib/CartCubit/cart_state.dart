

import 'package:equatable/equatable.dart';
 class CartState extends Equatable {
  final List<String> items;

  const CartState({this.items = const []});

  @override
  List<Object> get props => [items];
}