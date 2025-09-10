class UserService {
  String initials(String name) {
    if (name.trim().isEmpty) return "NO";

    // Remove emojis e caracteres especiais, mantendo apenas letras, espaços, _ e -
    String cleanedName = name.replaceAll(
      RegExp(r'[^\p{L}\s_-]', unicode: true),
      '',
    );

    // Expressão regular que substitui _ e - por espaços
    cleanedName = cleanedName.replaceAll(RegExp(r'[_-]'), ' ');

    // Remove múltiplos espaços em sequência, deixando apenas um
    cleanedName = cleanedName.replaceAll(RegExp(r'\s+'), ' ');

    final parts = cleanedName.trim().split(' ');

    // Remove partes vazias e partes que não são palavras válidas
    parts.removeWhere(
      (part) => part.isEmpty || !RegExp(r'^[a-zA-ZÀ-ÿ]+$').hasMatch(part),
    );

    if (parts.isEmpty) return "NO";

    String result = '';

    // LÓGICA CORRETA: sempre retorna exatamente 2 caracteres
    // Se tem apenas uma palavra (só nome): primeira + segunda letra
    if (parts.length == 1) {
      String nameStr = parts[0];
      if (nameStr.length >= 2) {
        result = nameStr[0].toUpperCase() + nameStr[1].toUpperCase();
      } else {
        // Se o nome tem apenas 1 letra, duplica
        result = nameStr[0].toUpperCase() + nameStr[0].toUpperCase();
      }
    }
    // Se tem duas ou mais palavras: APENAS primeira + última inicial
    else {
      result = parts.first[0].toUpperCase() + parts.last[0].toUpperCase();
    }

    return result;
  }
  
  String cleanString(String input) {
    String cleaned = input.replaceAll(RegExp(r'[_-]'), ' ');
    return cleaned.replaceAll(RegExp(r'\s+'), ' ');
  }
}
