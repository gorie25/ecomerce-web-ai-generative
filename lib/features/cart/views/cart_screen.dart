import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../stores/cart_store.dart';
import '../../../app_constants.dart';
import '../../../shared/utils/app_localizations.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ['INFORMATION', 'SHIPPING', 'PAYMENT'];

  @override
  Widget build(BuildContext context) {
    final cartStore = Provider.of<CartStore>(context);

    return Scaffold(
      backgroundColor: AppConstants.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppConstants.backgroundLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (cartStore.cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: GoogleFonts.outfit(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return Row(
            children: [
              // Left side - Checkout Form
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(48.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CHECKOUT',
                        style: GoogleFonts.outfit(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // Tabs
                      Row(
                        children: List.generate(_tabs.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedTab = index;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    _tabs[index],
                                    style: GoogleFonts.outfit(
                                      fontSize: 14,
                                      fontWeight: _selectedTab == index
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: _selectedTab == index
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    height: 2,
                                    width: 100,
                                    color: _selectedTab == index
                                        ? Colors.black
                                        : Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 40),
                      
                      // Contact Info
                      Text(
                        'CONTACT INFO',
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildTextField('Email'),
                      const SizedBox(height: 16),
                      _buildTextField('Phone'),
                      const SizedBox(height: 32),
                      
                      // Shipping Address
                      Text(
                        'SHIPPING ADDRESS',
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: _buildTextField('First Name')),
                          const SizedBox(width: 16),
                          Expanded(child: _buildTextField('Last Name')),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildDropdown('Country'),
                      const SizedBox(height: 16),
                      _buildTextField('State / Region'),
                      const SizedBox(height: 16),
                      _buildTextField('Address'),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: _buildTextField('City')),
                          const SizedBox(width: 16),
                          Expanded(child: _buildTextField('Postal Code')),
                        ],
                      ),
                      const SizedBox(height: 32),
                      
                      // Shipping Button
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            side: const BorderSide(color: Colors.black, width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Shipping',
                                style: GoogleFonts.outfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Right side - Order Summary
              Container(
                width: 400,
                color: Colors.grey[50],
                padding: const EdgeInsets.all(48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'YOUR ORDER',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              const Icon(Icons.edit_outlined, size: 16, color: Colors.black),
                              const SizedBox(width: 4),
                              Text(
                                '(${cartStore.cartItems.length})',
                                style: GoogleFonts.outfit(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Cart Items
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartStore.cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartStore.cartItems[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      item.product.imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) =>
                                          const Icon(Icons.image, size: 40),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.product.name,
                                        style: GoogleFonts.outfit(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Black/L',
                                        style: GoogleFonts.outfit(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '(${item.quantity})',
                                            style: GoogleFonts.outfit(
                                              fontSize: 12,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          Text(
                                            '\$ ${item.product.price.toStringAsFixed(0)}',
                                            style: GoogleFonts.outfit(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: const Size(0, 0),
                                        ),
                                        child: Text(
                                          'Change',
                                          style: GoogleFonts.outfit(
                                            fontSize: 12,
                                            color: Colors.black,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    
                    const Divider(),
                    const SizedBox(height: 16),
                    
                    // Subtotal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: GoogleFonts.outfit(fontSize: 14),
                        ),
                        Text(
                          '\$${cartStore.totalPrice.toStringAsFixed(2)}',
                          style: GoogleFonts.outfit(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    
                    // Shipping
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping',
                          style: GoogleFonts.outfit(fontSize: 14),
                        ),
                        Text(
                          'Calculated at next step',
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    
                    // Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${cartStore.totalPrice.toStringAsFixed(2)}',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.outfit(fontSize: 14, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.black),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildDropdown(String label) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.outfit(fontSize: 14, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      items: ['United States', 'Vietnam', 'Other'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: GoogleFonts.outfit(fontSize: 14)),
        );
      }).toList(),
      onChanged: (value) {},
    );
  }
}
