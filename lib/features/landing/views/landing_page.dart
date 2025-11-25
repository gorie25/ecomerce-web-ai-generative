import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../../app_constants.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            _buildHeader(context),
            
            // New Collection Section
            _buildNewCollectionSection(context),
            
            // New This Week Section
            _buildNewThisWeekSection(),
            
            // XIV Collections Section
            _buildXIVCollectionsSection(),
            
            // Our Approach Section
            _buildOurApproachSection(),
            
            // Footer
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => context.push('/home'),
                child: Text('Home', style: GoogleFonts.outfit(color: Colors.black)),
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
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
                onPressed: () => context.push('/cart'),
              ),
              IconButton(
                icon: const Icon(Icons.person_outline, color: Colors.black),
                onPressed: () => context.push('/profile'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewCollectionSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NEW\nCOLLECTION',
                  style: GoogleFonts.outfit(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Summer\n2024',
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () => context.push('/home'),
                  child: Row(
                    children: [
                      Text(
                        'GO TO SHOP',
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 100,
                        height: 1,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 20),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/landing_hero_white.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.checkroom, size: 100, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue, width: 3),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/landing_hero_black.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.checkroom, size: 100, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewThisWeekSection() {
    final products = [
      {'name': 'Abstract Print Shirt', 'price': 99, 'image': 'assets/images/product_1.png'},
      {'name': 'Basic Slim Fit T-Shirt', 'price': 99, 'image': 'assets/images/product_2.png'},
      {'name': 'Casual Sneakers', 'price': 199, 'image': 'assets/images/product_3.png'},
      {'name': 'Full Sleeve Zipper', 'price': 199, 'image': 'assets/images/product_4.png'},
    ];

    return Container(
      padding: const EdgeInsets.all(60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'NEW\nTHIS WEEK',
                    style: GoogleFonts.outfit(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '(50)',
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  width: 250,
                  margin: const EdgeInsets.only(right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              product['image'] as String,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(Icons.checkroom, size: 80, color: Colors.grey),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        product['name'] as String,
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$ ${product['price']}',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
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
    );
  }

  Widget _buildXIVCollectionsSection() {
    final products = [
      {'name': 'Abstract Print Shirt', 'price': 99, 'image': 'assets/images/product_1.png'},
      {'name': 'Basic Slim Fit T-Shirt', 'price': 99, 'image': 'assets/images/product_2.png'},
      {'name': 'Casual Sneakers', 'price': 199, 'image': 'assets/images/product_3.png'},
    ];

    return Container(
      padding: const EdgeInsets.all(60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'XIV\nCOLLECTIONS\n23-24',
            style: GoogleFonts.outfit(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text('(ALL)', style: GoogleFonts.outfit(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Men', style: GoogleFonts.outfit(color: Colors.grey)),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Women', style: GoogleFonts.outfit(color: Colors.grey)),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Kid', style: GoogleFonts.outfit(color: Colors.grey)),
              ),
            ],
          ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          product['image'] as String,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.checkroom, size: 80, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    product['name'] as String,
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$ ${product['price']}',
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOurApproachSection() {
    return Container(
      padding: const EdgeInsets.all(60),
      color: Colors.grey[100],
      child: Column(
        children: [
          Text(
            'OUR APPROACH TO FASHION DESIGN',
            style: GoogleFonts.outfit(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'At elegant vogue, we blend creativity and craftsmanship to create\nfashion that transcends time and trends. Our focus is on delivering\nexceptional quality and timeless style that speaks to the modern,\nelegant, finish',
            style: GoogleFonts.outfit(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.8,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60),
      child: Column(
        children: [
          const SizedBox(height: 40),
          SizedBox(
            width: 300,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 0,
              ),
              onPressed: () => context.push('/home'),
              child: Text(
                'ENTER SHOP',
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
          Text(
            '© 2024 Cloth Store. All rights reserved.',
            style: GoogleFonts.outfit(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
