import 'package:flutter/material.dart';
import 'package:flutterapp/models/user_model.dart';
import 'package:flutterapp/repository/users_repository.dart';

class FormUserPage extends StatefulWidget {
  const FormUserPage({super.key, this.userEdit});

  final UserModel? userEdit;

  @override
  State<FormUserPage> createState() => _FormUserPageState();
}

class _FormUserPageState extends State<FormUserPage> {
  final TextEditingController txtNameController = TextEditingController();
  final TextEditingController txtEmailController = TextEditingController();
  final TextEditingController txtPhotoController = TextEditingController();

  String? id;
  String? createdAt;

  final formKey = GlobalKey<FormState>();
  final repository = UsersRepository();

  updateUser() async {
    try {
      await repository.updateUser(
        UserModel(
          id: id ?? '',
          name: txtNameController.text,
          email: txtEmailController.text,
          avatar: txtPhotoController.text,
          createdAt: createdAt ?? '',
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dados atualizados com sucesso!')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao atualizar: $e')));
    }
  }

  saveUser() async {
    try {
      UserModel userModel = UserModel(
        name: txtNameController.text,
        email: txtEmailController.text,
        avatar: txtPhotoController.text,
        id: '',
        createdAt: '',
      );

      await repository.postNewUser(userModel);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário criado com sucesso!')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao criar usuário: $e')));
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.userEdit != null) {
      txtNameController.text = widget.userEdit!.name ?? '';
      txtEmailController.text = widget.userEdit!.email ?? '';
      txtPhotoController.text = widget.userEdit!.avatar ?? '';
      id = widget.userEdit!.id;
      createdAt = widget.userEdit!.createdAt;
    }
  }

  @override
  void dispose() {
    txtNameController.dispose();
    txtEmailController.dispose();
    txtPhotoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.userEdit != null ? "Editar Usuário" : "Novo Usuário",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: txtNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Preencha o nome";
                  }
                  if (value.length < 2) {
                    return "Nome deve ter pelo menos 2 caracteres";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Digite seu nome",
                  labelText: "Nome",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: txtEmailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Preencha o e-mail";
                  }
                  if (!RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  ).hasMatch(value)) {
                    return "Digite um e-mail válido";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Digite seu E-mail",
                  labelText: "E-mail",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: txtPhotoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Preencha a URL da foto";
                  }

                  final uri = Uri.tryParse(value);
                  if (uri == null || !uri.hasScheme) {
                    return "Digite uma URL válida";
                  }

                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "https://exemplo.com/foto.jpg",
                  labelText: "URL da Foto",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (widget.userEdit != null) {
                        updateUser();
                      } else {
                        saveUser();
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    widget.userEdit != null ? "Atualizar" : "Salvar",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
