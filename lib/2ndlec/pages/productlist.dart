import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final Color color;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.color,
    required this.price,
  });
}

// ignore: non_constant_identifier_names
final List<Product> Productlist = [
  Product(
    id: 1,
    name: "apple",
    color: Colors.red,
    price: 120,
  ),
  Product(
    id: 2,
    name: "Guava",
    color: Colors.green,
    price: 90,
  ),
  Product(
    id: 3,
    name: "pineapple",
    color: Colors.blue,
    price: 170,
  ),
  Product(
    id: 4,
    name: "custard Apple",
    color: Colors.red,
    price: 100,
  ),
  Product(
    id: 5,
    name: "Santra",
    color: Colors.yellow,
    price: 12,
  ),
];
