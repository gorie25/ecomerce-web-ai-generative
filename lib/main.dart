import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'app_constants.dart';
import 'core/router/app_router.dart';
import 'features/auth/stores/auth_store.dart';
import 'features/cart/stores/cart_store.dart';
import 'features/home/stores/product_store.dart';
import 'features/settings/stores/settings_store.dart';
import 'shared/utils/app_localizations.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => AuthStore()),
        Provider<ProductStore>(create: (_) => ProductStore()),
        Provider<CartStore>(create: (_) => CartStore()),
        Provider<SettingsStore>(create: (_) => SettingsStore()),
      ],
      child: const ECommerceAppView(),
    );
  }
}

class ECommerceAppView extends StatelessWidget {
  const ECommerceAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsStore = Provider.of<SettingsStore>(context);

    return Observer(
      builder: (_) {
        return MaterialApp.router(
          title: 'ECommerce App',
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          theme: ThemeData(
            primaryColor: AppConstants.primaryGold,
            scaffoldBackgroundColor: AppConstants.backgroundLight,
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppConstants.primaryGold,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            primaryColor: AppConstants.primaryGold,
            scaffoldBackgroundColor: AppConstants.backgroundDark,
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppConstants.primaryGold,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: settingsStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          locale: Locale(settingsStore.languageCode),
          supportedLocales: const [
            Locale('en', ''),
            Locale('vi', ''),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
