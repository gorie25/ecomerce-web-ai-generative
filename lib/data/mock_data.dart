import 'package:flutter/material.dart';
import '../core/models/product_model.dart';

final List<Product> mockProducts = [
  Product(
    id: '1',
    name: 'Abstract Print T-Shirt',
    description: 'Relaxed fit t-shirt. Camp collar and short sleeves. Button up front.',
    price: 99,
    imageUrl: 'assets/images/product_1.png',
    category: ProductCategory.shirt,
    colors: [Colors.black, Colors.white, const Color(0xFFB8E6D5)], // Black, White, Mint
  ),
  Product(
    id: '2',
    name: 'Basic Slim Fit T-Shirt',
    description: 'High quality leather bag, handcrafted.',
    price: 99,
    imageUrl: 'assets/images/product_2.png',
    category: ProductCategory.shirt,
    colors: [const Color(0xFFE8E8E8), const Color(0xFF6B6B6B), Colors.white], // Light Gray, Dark Gray, White
  ),
  Product(
    id: '3',
    name: 'Casual Sneakers',
    description: 'Stylish sneakers for everyday wear.',
    price: 199,
    imageUrl: 'assets/images/product_3.png',
    category: ProductCategory.shoes,
    colors: [Colors.white, const Color(0xFFE8E8E8), Colors.black], // White, Light Gray, Black
  ),
  Product(
    id: '4',
    name: 'Full Sleeve Zipper',
    description: 'Comfortable zipper jacket for daily use.',
    price: 199,
    imageUrl: 'assets/images/product_4.png',
    category: ProductCategory.jacket,
    colors: [Colors.black, const Color(0xFF6B6B6B), const Color(0xFFB8E6D5)], // Black, Dark Gray, Mint
  ),
  Product(
    id: '5',
    name: 'Basic Heavy Weight T-Shirt',
    description: 'Noise cancelling headphones with great sound.',
    price: 99,
    imageUrl: 'assets/images/product_5.png',
    category: ProductCategory.shirt,
    colors: [const Color(0xFF6B6B6B), Colors.black, Colors.white], // Dark Gray, Black, White
  ),
];
