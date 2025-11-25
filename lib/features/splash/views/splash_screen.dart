import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../../app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/landing');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Placeholder (Diamond shape from Figma)
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(0),
              ),
              child: Transform.rotate(
                angle: 0.785398, // 45 degrees in radians
                child: Container(
                  color: Colors.black,
                ),
              ),
            )
            .animate()
            .fadeIn(duration: 800.ms)
            .scale(delay: 200.ms, duration: 600.ms),
            
            const SizedBox(height: 24),
            
            Text(
              'CLOTH STORE',
              style: GoogleFonts.outfit(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
                color: AppConstants.textLight,
              ),
            )
            .animate()
            .fadeIn(delay: 600.ms, duration: 800.ms)
            .moveY(begin: 20, end: 0),
          ],
        ),
      ),
    );
  }
}
