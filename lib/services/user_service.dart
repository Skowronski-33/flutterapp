class UserService {
  String initials(String name) {
    if (name.trim().isEmpty) return "NO";

    String cleanedName = name.replaceAll(
      RegExp(r'[^\p{L}\s_-]', unicode: true),
      '',
    );

    cleanedName = cleanedName.replaceAll(RegExp(r'[_-]'), ' ');

    cleanedName = cleanedName.replaceAll(RegExp(r'\s+'), ' ');

    final parts = cleanedName.trim().split(' ');

    parts.removeWhere(
      (part) => part.isEmpty || !RegExp(r'^[a-zA-ZÀ-ÿ]+$').hasMatch(part),
    );

    if (parts.isEmpty) return "NO";

    String result = '';

    if (parts.length == 1) {
      String nameStr = parts[0];
      if (nameStr.length >= 2) {
        result = nameStr[0].toUpperCase() + nameStr[1].toUpperCase();
      } else {
        result = nameStr[0].toUpperCase() + nameStr[0].toUpperCase();
      }
    }
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
