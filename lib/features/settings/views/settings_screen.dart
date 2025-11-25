import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/settings_store.dart';
import '../../../app_constants.dart';
import '../../../shared/utils/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsStore = Provider.of<SettingsStore>(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('settings_title')),
        backgroundColor: AppConstants.primaryGold,
        foregroundColor: AppConstants.textLight,
      ),
      body: Observer(
        builder: (_) {
          return ListView(
            children: [
              SwitchListTile(
                title: Text(localizations.translate('dark_mode')),
                value: settingsStore.isDarkMode,
                onChanged: (value) => settingsStore.toggleDarkMode(),
                activeColor: AppConstants.primaryGold,
              ),
              ListTile(
                title: Text(localizations.translate('language')),
                trailing: DropdownButton<String>(
                  value: settingsStore.languageCode,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      settingsStore.setLanguage(newValue);
                    }
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(localizations.translate('english')),
                    ),
                    DropdownMenuItem(
                      value: 'vi',
                      child: Text(localizations.translate('vietnamese')),
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
}
