import 'package:flutter/material.dart';

enum ProductCategory {
  shirt,
  pants,
  jacket,
  shoes,
}

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final ProductCategory category;
  final List<Color> colors;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.colors,
  });
}
