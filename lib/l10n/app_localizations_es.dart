// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get loginEmailHint => 'Introduce tu email';

  @override
  String get loginPasswordHint => 'Introduce tu contraseña';

  @override
  String get loginButton => 'Iniciar sesión';

  @override
  String get forgotPassword => 'Olvidé mi contraseña';

  @override
  String get userListTitle => 'Lista de usuarios';

  @override
  String get noUsersFound => 'No se encontraron usuarios';

  @override
  String get noEmail => 'Sin email';

  @override
  String get edit => 'Editar';

  @override
  String get delete => 'Eliminar';

  @override
  String error(String error) {
    return 'Error: $error';
  }

  @override
  String get deleteConfirmTitle => 'Confirmación';

  @override
  String get deleteConfirmMessage => '¿Confirmar eliminación de este usuario?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get editUser => 'Editar Usuario';

  @override
  String get newUser => 'Nuevo Usuario';

  @override
  String get nameHint => 'Introduce tu nombre';

  @override
  String get nameLabel => 'Nombre';

  @override
  String get emailHint => 'Introduce tu email';

  @override
  String get emailLabel => 'Email';

  @override
  String get photoUrlHint => 'https://ejemplo.com/foto.jpg';

  @override
  String get photoUrlLabel => 'URL de la Foto';

  @override
  String get update => 'Actualizar';

  @override
  String get save => 'Guardar';

  @override
  String get nameRequired => 'Por favor introduce un nombre';

  @override
  String get nameMinLength => 'El nombre debe tener al menos 2 caracteres';

  @override
  String get emailRequired => 'Por favor introduce un email';

  @override
  String get emailInvalid => 'Por favor introduce un email válido';

  @override
  String get photoUrlRequired => 'Por favor introduce una URL de foto';

  @override
  String get photoUrlInvalid => 'Por favor introduce una URL válida';

  @override
  String get userUpdatedSuccess => '¡Datos actualizados correctamente!';

  @override
  String userUpdateError(String error) {
    return 'Error al actualizar: $error';
  }

  @override
  String get userCreatedSuccess => '¡Usuario creado correctamente!';

  @override
  String userCreateError(String error) {
    return 'Error al crear usuario: $error';
  }

  @override
  String get userDetailsTitle => 'Detalles del Usuario';

  @override
  String get detailedInfo => 'Información Detallada';

  @override
  String get idLabel => 'ID';

  @override
  String get fullNameLabel => 'Nombre Completo';

  @override
  String get registrationDateLabel => 'Fecha de Registro';

  @override
  String get back => 'Atrás';

  @override
  String get language => 'Idioma';

  @override
  String get menuTitle => 'Menú Principal';

  @override
  String get changeLanguage => 'Cambiar idioma de la app';
}
