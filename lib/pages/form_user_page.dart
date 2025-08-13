import 'package:flutter/material.dart';

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
                  if (formKey.currentState!.validate()) {}
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
