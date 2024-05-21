import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/1st%20lec/count_provider.dart';
import 'package:provider_example/api_integration/view/home.dart';
import '2ndlec/pages/productscreen.dart';
import '2ndlec/provider/cart_provider.dart';
import 'api_integration/provider/pets_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => NumberListProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartProvider(),
          ),
           ChangeNotifierProvider(
            create: (context) => PetsProvider(),
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ));
  }
}
