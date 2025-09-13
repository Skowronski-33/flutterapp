import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/l10n/app_localizations.dart';
import 'package:flutterapp/providers/language_provider.dart';

class LanguageSelectorWidget extends StatelessWidget {
  const LanguageSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.language, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              Text(
                "Selecionar Idioma",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Lista de idiomas
          _buildLanguageOption(
            context,
            languageProvider,
            const Locale('pt'),
            '🇧🇷 Português',
          ),
          const SizedBox(height: 8),
          
          _buildLanguageOption(
            context,
            languageProvider,
            const Locale('en'),
            '🇺🇸 English',
          ),
          const SizedBox(height: 8),
          
          _buildLanguageOption(
            context,
            languageProvider,
            const Locale('es'),
            '🇪🇸 Español',
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    LanguageProvider languageProvider,
    Locale locale,
    String label,
  ) {
    final isSelected = languageProvider.locale.languageCode == locale.languageCode;
    
    return InkWell(
      onTap: () async {
        await languageProvider.changeLanguage(locale);
        Navigator.pop(context); // Fechar drawer
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.1) : null,
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