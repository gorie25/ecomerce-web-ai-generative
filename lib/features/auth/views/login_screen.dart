import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/auth_store.dart';
import '../../../app_constants.dart';
import '../../../shared/utils/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppConstants.backgroundLight,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localizations.translate('login_title'),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.textLight,
                ),
              ),
              const SizedBox(height: 48),
              Observer(
                builder: (_) => TextField(
                  onChanged: authStore.setUsername,
                  decoration: InputDecoration(
                    labelText: localizations.translate('username'),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) => TextField(
                  onChanged: authStore.setPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: localizations.translate('password'),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Observer(
                builder: (_) => authStore.isLoading
                    ? const CircularProgressIndicator(
                        color: AppConstants.primaryGold,
                      )
                    : SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppConstants.primaryGold,
                            foregroundColor: AppConstants.textLight,
                          ),
                          onPressed: () async {
                            if (await authStore.login()) {
                              if (context.mounted) {
                                Navigator.pushReplacementNamed(context, '/home');
                              }
                            }
                          },
                          child: Text(localizations.translate('login_button')),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
