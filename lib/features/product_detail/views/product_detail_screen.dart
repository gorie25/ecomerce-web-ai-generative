import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/models/product_model.dart';
import '../../cart/stores/cart_store.dart';
import '../../../app_constants.dart';
import '../../../shared/utils/app_localizations.dart';
import 'widgets/full_screen_image_viewer.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 2; // Default to 'M'
  
  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL', '2X'];

  @override
  Widget build(BuildContext context) {
    final cartStore = Provider.of<CartStore>(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppConstants.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppConstants.backgroundLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('Home', style: GoogleFonts.outfit(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Collections', style: GoogleFonts.outfit(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Deals', style: GoogleFonts.outfit(color: Colors.black)),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          Observer(
            builder: (_) => Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
                  onPressed: () => context.push('/cart'),
                ),
                if (cartStore.totalItems > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '${cartStore.totalItems}',
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onPressed: () => context.push('/profile'),
          ),
        ],
      ),
      body: Row(
        children: [
          // Left side - Image Gallery
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  // Thumbnail column
                  SizedBox(
                    width: 80,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullScreenImageViewer(
                                  imageUrl: widget.product.imageUrl,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: index == 0 ? Colors.black : Colors.grey.shade300,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset(
                                widget.product.imageUrl,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 80,
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.image, size: 30),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 24),
                  // Main image
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenImageViewer(
                              imageUrl: widget.product.imageUrl,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            widget.product.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: const Center(
                                  child: Icon(Icons.image, size: 100),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Right side - Product Info
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(48.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name.toUpperCase(),
                      style: GoogleFonts.outfit(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${widget.product.price.toStringAsFixed(0)}',
                      style: GoogleFonts.outfit(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'MRP incl. of all taxes',
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      widget.product.description,
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Color selector
                    Text(
                      'Color',
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: List.generate(widget.product.colors.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedColorIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: widget.product.colors[index],
                              border: Border.all(
                                color: _selectedColorIndex == index
                                    ? Colors.black
                                    : Colors.grey.shade300,
                                width: _selectedColorIndex == index ? 2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 32),
                    
                    // Size selector
                    Text(
                      'Size',
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: List.generate(_sizes.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedSizeIndex = index;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 40,
                            decoration: BoxDecoration(
                              color: _selectedSizeIndex == index
                                  ? Colors.black
                                  : Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                _sizes[index],
                                style: GoogleFonts.outfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: _selectedSizeIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'FIND YOUR SIZE',
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '|',
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'MEASUREMENT GUIDE',
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    
                    // Add to cart button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          cartStore.addItemToCart(widget.product, 1);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${widget.product.name} added to cart'),
                              duration: const Duration(seconds: 1),
                              backgroundColor: Colors.black,
                            ),
                          );
                        },
                        child: Text(
                          'ADD',
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
