import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// Email input hint on login page
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get loginEmailHint;

  /// Password input hint on login page
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get loginPasswordHint;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// Forgot password link text
  ///
  /// In en, this message translates to:
  /// **'Forgot my password'**
  String get forgotPassword;

  /// Title of users list page
  ///
  /// In en, this message translates to:
  /// **'Users List'**
  String get userListTitle;

  /// Message when no users are found
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get noUsersFound;

  /// Text when user has no email
  ///
  /// In en, this message translates to:
  /// **'No email'**
  String get noEmail;

  /// Edit action text
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Delete action text
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Error message with parameter
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String error(String error);

  /// Delete confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get deleteConfirmTitle;

  /// Delete confirmation dialog message
  ///
  /// In en, this message translates to:
  /// **'Confirm deletion of this user?'**
  String get deleteConfirmMessage;

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Confirm button text
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Edit user page title
  ///
  /// In en, this message translates to:
  /// **'Edit User'**
  String get editUser;

  /// New user page title
  ///
  /// In en, this message translates to:
  /// **'New User'**
  String get newUser;

  /// Name input hint
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get nameHint;

  /// Name input label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// Email input hint
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailHint;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// Photo URL input hint
  ///
  /// In en, this message translates to:
  /// **'https://example.com/photo.jpg'**
  String get photoUrlHint;

  /// Photo URL input label
  ///
  /// In en, this message translates to:
  /// **'Photo URL'**
  String get photoUrlLabel;

  /// Update button text
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// Save button text
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Name required validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter a name'**
  String get nameRequired;

  /// Name minimum length validation message
  ///
  /// In en, this message translates to:
  /// **'Name must have at least 2 characters'**
  String get nameMinLength;

  /// Email required validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter an email'**
  String get emailRequired;

  /// Email invalid validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get emailInvalid;

  /// Photo URL required validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter a photo URL'**
  String get photoUrlRequired;

  /// Photo URL invalid validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid URL'**
  String get photoUrlInvalid;

  /// User updated success message
  ///
  /// In en, this message translates to:
  /// **'Data updated successfully!'**
  String get userUpdatedSuccess;

  /// User update error message
  ///
  /// In en, this message translates to:
  /// **'Error updating: {error}'**
  String userUpdateError(String error);

  /// User created success message
  ///
  /// In en, this message translates to:
  /// **'User created successfully!'**
  String get userCreatedSuccess;

  /// User create error message
  ///
  /// In en, this message translates to:
  /// **'Error creating user: {error}'**
  String userCreateError(String error);

  /// User details page title
  ///
  /// In en, this message translates to:
  /// **'User Details'**
  String get userDetailsTitle;

  /// Detailed information card title
  ///
  /// In en, this message translates to:
  /// **'Detailed Information'**
  String get detailedInfo;

  /// ID field label
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get idLabel;

  /// Full name field label
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullNameLabel;

  /// Registration date field label
  ///
  /// In en, this message translates to:
  /// **'Registration Date'**
  String get registrationDateLabel;

  /// Back button text
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Language selection text
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Menu title
  ///
  /// In en, this message translates to:
  /// **'Main Menu'**
  String get menuTitle;

  /// Change language subtitle
  ///
  /// In en, this message translates to:
  /// **'Change app language'**
  String get changeLanguage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
