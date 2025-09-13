// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginEmailHint => 'Enter your email';

  @override
  String get loginPasswordHint => 'Enter your password';

  @override
  String get loginButton => 'Login';

  @override
  String get forgotPassword => 'Forgot my password';

  @override
  String get userListTitle => 'Users List';

  @override
  String get noUsersFound => 'No users found';

  @override
  String get noEmail => 'No email';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String error(String error) {
    return 'Error: $error';
  }

  @override
  String get deleteConfirmTitle => 'Confirmation';

  @override
  String get deleteConfirmMessage => 'Confirm deletion of this user?';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get editUser => 'Edit User';

  @override
  String get newUser => 'New User';

  @override
  String get nameHint => 'Enter your name';

  @override
  String get nameLabel => 'Name';

  @override
  String get emailHint => 'Enter your email';

  @override
  String get emailLabel => 'Email';

  @override
  String get photoUrlHint => 'https://example.com/photo.jpg';

  @override
  String get photoUrlLabel => 'Photo URL';

  @override
  String get update => 'Update';

  @override
  String get save => 'Save';

  @override
  String get nameRequired => 'Please enter a name';

  @override
  String get nameMinLength => 'Name must have at least 2 characters';

  @override
  String get emailRequired => 'Please enter an email';

  @override
  String get emailInvalid => 'Please enter a valid email';

  @override
  String get photoUrlRequired => 'Please enter a photo URL';

  @override
  String get photoUrlInvalid => 'Please enter a valid URL';

  @override
  String get userUpdatedSuccess => 'Data updated successfully!';

  @override
  String userUpdateError(String error) {
    return 'Error updating: $error';
  }

  @override
  String get userCreatedSuccess => 'User created successfully!';

  @override
  String userCreateError(String error) {
    return 'Error creating user: $error';
  }

  @override
  String get userDetailsTitle => 'User Details';

  @override
  String get detailedInfo => 'Detailed Information';

  @override
  String get idLabel => 'ID';

  @override
  String get fullNameLabel => 'Full Name';

  @override
  String get registrationDateLabel => 'Registration Date';

  @override
  String get back => 'Back';

  @override
  String get language => 'Language';

  @override
  String get menuTitle => 'Main Menu';

  @override
  String get changeLanguage => 'Change app language';
}
