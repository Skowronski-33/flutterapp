// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get loginEmailHint => 'Informe o seu Email';

  @override
  String get loginPasswordHint => 'Informe a sua Senha';

  @override
  String get loginButton => 'Entrar';

  @override
  String get forgotPassword => 'Esqueci minha senha';

  @override
  String get userListTitle => 'Lista de usuários';

  @override
  String get noUsersFound => 'Nenhum usuário encontrado';

  @override
  String get noEmail => 'Sem email';

  @override
  String get edit => 'Editar';

  @override
  String get delete => 'Excluir';

  @override
  String error(String error) {
    return 'Erro: $error';
  }

  @override
  String get deleteConfirmTitle => 'Confirmação';

  @override
  String get deleteConfirmMessage => 'Confirma exclusão deste usuário?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get editUser => 'Editar Usuário';

  @override
  String get newUser => 'Novo Usuário';

  @override
  String get nameHint => 'Digite seu nome';

  @override
  String get nameLabel => 'Nome';

  @override
  String get emailHint => 'Digite seu E-mail';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get photoUrlHint => 'https://exemplo.com/foto.jpg';

  @override
  String get photoUrlLabel => 'URL da Foto';

  @override
  String get update => 'Atualizar';

  @override
  String get save => 'Salvar';

  @override
  String get nameRequired => 'Preencha o nome';

  @override
  String get nameMinLength => 'Nome deve ter pelo menos 2 caracteres';

  @override
  String get emailRequired => 'Preencha o e-mail';

  @override
  String get emailInvalid => 'Digite um e-mail válido';

  @override
  String get photoUrlRequired => 'Preencha a URL da foto';

  @override
  String get photoUrlInvalid => 'Digite uma URL válida';

  @override
  String get userUpdatedSuccess => 'Dados atualizados com sucesso!';

  @override
  String userUpdateError(String error) {
    return 'Erro ao atualizar: $error';
  }

  @override
  String get userCreatedSuccess => 'Usuário criado com sucesso!';

  @override
  String userCreateError(String error) {
    return 'Erro ao criar usuário: $error';
  }

  @override
  String get userDetailsTitle => 'Detalhes do Usuário';

  @override
  String get detailedInfo => 'Informações Detalhadas';

  @override
  String get idLabel => 'ID';

  @override
  String get fullNameLabel => 'Nome Completo';

  @override
  String get registrationDateLabel => 'Data de Cadastro';

  @override
  String get back => 'Voltar';

  @override
  String get language => 'Idioma';

  @override
  String get menuTitle => 'Menu Principal';

  @override
  String get changeLanguage => 'Alterar idioma do app';
}
