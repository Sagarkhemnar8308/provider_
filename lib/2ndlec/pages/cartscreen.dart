import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/2ndlec/provider/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartprovider = Provider.of<CartProvider>(context);
    return Scaffold(
      bottomNavigationBar: cartprovider.items.isEmpty
          ? const SizedBox()
          : SizedBox(
              height: 40,
              child: Center(
                child: Text(
                  'Amount ${cartprovider.getCartTotal().toInt()} rs',
                ),
              ),
            ),
      appBar: AppBar(
        title: const Text('Cart '),
      ),
      body: cartprovider.items.isEmpty
          ? const Center(
              child: Text("No Added To Cart !"),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    cartprovider.remove(cartprovider.items[index]);
                  },
                  title: Text(
                    cartprovider.items[index].name.toString(),
                  ),
                  trailing:
                      Text("${cartprovider.items[index].price.toInt()} rs"),
                );
              },
              itemCount: cartprovider.items.length,
            ),
    );
  }
}
