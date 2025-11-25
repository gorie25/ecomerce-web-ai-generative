import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../stores/product_store.dart';
import '../../cart/stores/cart_store.dart';
import '../../../app_constants.dart';
import '../../../core/models/product_model.dart';
import '../../../shared/utils/app_localizations.dart';
import '../../product_detail/views/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, ProductCategory?> _categories = {
    'ALL': null,
    'SHIRTS': ProductCategory.shirt,
    'PANTS': ProductCategory.pants,
    'JACKETS': ProductCategory.jacket,
    'SHOES': ProductCategory.shoes,
  };
  String _selectedCategoryKey = 'ALL';
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductStore>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productStore = Provider.of<ProductStore>(context);
    final cartStore = Provider.of<CartStore>(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppConstants.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppConstants.backgroundLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('Home', style: GoogleFonts.outfit(color: Colors.black, fontWeight: FontWeight.w600)),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Collections', style: GoogleFonts.outfit(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {},
              child: Text('New', style: GoogleFonts.outfit(color: Colors.black)),
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
      body: Observer(
        builder: (_) {
          if (productStore.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }

          if (productStore.products.isEmpty) {
            return const Center(child: Text('No products found'));
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Sidebar - Filters
              Container(
                width: 250,
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Filters',
                        style: GoogleFonts.outfit(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Size Filter
                      _buildFilterSection(
                        'Size',
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: ['XS', 'S', 'M', 'L', 'XL', '2X'].map((size) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                size,
                                style: GoogleFonts.outfit(fontSize: 12),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      
                      // Availability Filter
                      _buildFilterSection(
                        'Availability',
                        Column(
                          children: [
                            _buildCheckbox('Availability (450)', true),
                            _buildCheckbox('Out Of Stock (18)', false),
                          ],
                        ),
                      ),
                      
                      // Category Filter
                      _buildExpandableFilter('Category'),
                      
                      // Colors Filter
                      _buildExpandableFilter('Colors'),
                      
                      // Price Range Filter
                      _buildExpandableFilter('Price Range'),
                      
                      // Collections Filter
                      _buildExpandableFilter('Collections'),
                      
                      // Tags Filter
                      _buildExpandableFilter('Tags'),
                      
                      // Ratings Filter
                      _buildExpandableFilter('Ratings'),
                    ],
                  ),
                ),
              ),
              
              // Right Side - Products
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Breadcrumb
                      Row(
                        children: [
                          Text(
                            'Home / Products',
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Title and Search
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PRODUCTS',
                            style: GoogleFonts.outfit(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: GoogleFonts.outfit(fontSize: 14),
                                prefixIcon: const Icon(Icons.search, size: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // Category Tabs
                      SizedBox(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: _categories.keys.map((categoryKey) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedCategoryKey = categoryKey;
                                  });
                                  productStore.setCategory(_categories[categoryKey]);
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: _selectedCategoryKey == categoryKey
                                      ? Colors.black
                                      : Colors.white,
                                  foregroundColor: _selectedCategoryKey == categoryKey
                                      ? Colors.white
                                      : Colors.black,
                                  side: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  categoryKey,
                                  style: GoogleFonts.outfit(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Product Grid
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 24,
                          ),
                          itemCount: productStore.filteredProducts.length,
                          itemBuilder: (context, index) {
                            final product = productStore.filteredProducts[index];
                            return GestureDetector(
                              onTap: () {
                                context.push('/product/${product.id}');
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          product.imageUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey[200],
                                              child: const Icon(Icons.image, size: 50),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Cotton T Shirt',
                                    style: GoogleFonts.outfit(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    product.name,
                                    style: GoogleFonts.outfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '\$ ${product.price.toStringAsFixed(0)}',
                                    style: GoogleFonts.outfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        content,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildCheckbox(String label, bool value) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (val) {},
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(
          label,
          style: GoogleFonts.outfit(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildExpandableFilter(String title) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(Icons.chevron_right, size: 20),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey.shade200, height: 1),
      ],
    );
  }
}
