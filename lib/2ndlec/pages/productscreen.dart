import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/2ndlec/pages/cartscreen.dart';
import 'package:provider_example/2ndlec/pages/productlist.dart';
import 'package:provider_example/2ndlec/provider/cart_provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartprovider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ));
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Productlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              height: 20,
              width: 20,
              color: Productlist[index].color,
            ),
            title: Text(Productlist[index].name.toString()),
            trailing: Checkbox(
                value: cartprovider.items.contains(
                  Productlist[index],
                ),
                onChanged: (v) {
                  if (v == true) {
                    cartprovider.add(Productlist[index]);
                  } else {
                    cartprovider.remove(Productlist[index]);
                  }
                }),
          );
        },
      ),
    );
  }
}
