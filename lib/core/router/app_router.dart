import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/views/splash_screen.dart';
import '../../features/landing/views/landing_page.dart';
import '../../features/auth/views/login_screen.dart';
import '../../features/home/views/home_screen.dart';
import '../../features/product_detail/views/product_detail_screen.dart';
import '../../features/cart/views/cart_screen.dart';
import '../../features/settings/views/settings_screen.dart';
import '../../features/profile/views/profile_screen.dart';
import '../../core/models/product_model.dart';
import '../../data/mock_data.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/landing',
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final productId = state.pathParameters['id']!;
        final product = mockProducts.firstWhere((p) => p.id == productId);
        return ProductDetailScreen(product: product);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
