import 'package:flutter/material.dart';
import 'package:flutterapp/models/user_model.dart';
import 'package:flutterapp/repository/users_repository.dart';

class FormUserPage extends StatefulWidget {
  const FormUserPage({super.key});

  @override
  State<FormUserPage> createState() => _FormUserPageState();
}

class _FormUserPageState extends State<FormUserPage> {
  TextEditingController txtNameController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtPhotoController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //instanciar o repositório
  final repository = UsersRepository();
  saveUser() async {
    try {
      //criar o UserModel a partir dos dados do formulário
      UserModel userModel = UserModel(
        name: txtNameController.text,
        email: txtEmailController.text,
        avatar: txtPhotoController.text, id: '', createdAt: '',
      );
      //salvar o usuário no banco
      await repository.postNewUser(userModel);
      //mostrar mensagem de sucesso
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Dados salvos!')));
      //voltar para a tela anterior
      Navigator.pop(context);
    } catch (e) {
      //mostrar mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulário de Usuário")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Preencha o nome";
                  }
                  return null;
                },
                controller: txtNameController,
                decoration: InputDecoration(
                  hintText: "Digite seu nome",
                  labelText: "Nome",
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Preencha o e-mail";
                  }
                  return null;
                },
                controller: txtEmailController,
                decoration: InputDecoration(
                  hintText: "Digite seu E-mail",
                  labelText: "E-mail",
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Preencha a URL da foto";
                  }
                  return null;
                },
                controller: txtPhotoController,
                decoration: InputDecoration(
                  hintText: "Preencha com a URL da foto",
                  labelText: "Foto",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    saveUser();
                  }
                },
                child: const Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
