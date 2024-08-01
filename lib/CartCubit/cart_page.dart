import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_cubit.dart';
import 'cart_state.dart';

class CartPage extends StatelessWidget {
  final TextEditingController _itemController = TextEditingController();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shopping Cart'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _itemController,
                decoration: const InputDecoration(
                  labelText: 'Item name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final item = _itemController.text;
                if (item.isNotEmpty) {
                  context.read<CartCubit>().addItem(item);
                  _itemController.clear();
                }
              },
              child: const Text('Add Item'),
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return ListTile(
                        title: Text(item),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            context.read<CartCubit>().removeItem(item);
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ));
  }
}
