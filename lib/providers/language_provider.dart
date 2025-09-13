import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('pt'); // Idioma padrão português

  Locale get locale => _locale;

  // Muda o idioma e salva nas preferências
  Future<void> changeLanguage(Locale locale) async {
    _locale = locale;
    notifyListeners();
    
    // Salvar preferência do usuário
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
  }

  // Carregar idioma salvo na inicialização
  Future<void> loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ?? 'pt';
    _locale = Locale(languageCode);
    notifyListeners();
  }
}