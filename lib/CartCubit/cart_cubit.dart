import 'package:bloc/bloc.dart';

import 'cart_state.dart';


class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addItem(String item) {
    final updatedItems = List<String>.from(state.items)..add(item);
    emit(CartState(items: updatedItems));
  }

  void removeItem(String item) {
    final updatedItems = List<String>.from(state.items)..remove(item);
    emit(CartState(items: updatedItems));
  }
}