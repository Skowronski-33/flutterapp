import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/providers/language_provider.dart';
import 'package:flutterapp/l10n/app_localizations.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.deepPurple),
            child: Text(
              l10n.menuTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Item 1: API - XX (seu item original)
          ListTile(
            leading: Icon(Icons.api, color: Theme.of(context).primaryColor),
            title: const Text('API - XX'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          // Item 2: Seletor de Idioma (CORRIGIDO)
          ExpansionTile(
            leading: Icon(
              Icons.language,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(l10n.language),
            subtitle: Text(l10n.changeLanguage), // ADICIONADA VÍRGULA
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildLanguageOption(const Locale('pt'), '🇧🇷 Português'),
                    const SizedBox(height: 8),
                    _buildLanguageOption(const Locale('en'), '🇺🇸 English'),
                    const SizedBox(height: 8),
                    _buildLanguageOption(const Locale('es'), '🇪🇸 Español'),
                  ],
                ),
              ),
            ],
          ), // FECHAMENTO CORRETO DO EXPANSIONTILE
          // Item 3: Tema (seu item original adaptado)
          ListTile(
            leading: Icon(Icons.palette, color: Theme.of(context).primaryColor),
            title: const Text('Tema novo do Flutter'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(Locale locale, String label) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isSelected =
        languageProvider.locale.languageCode == locale.languageCode;

    return InkWell(
      onTap: () async {
        await languageProvider.changeLanguage(locale);
        Navigator.pop(context); // Fechar drawer
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : null,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(color: Theme.of(context).primaryColor, width: 2)
              : Border.all(color: Colors.grey.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
