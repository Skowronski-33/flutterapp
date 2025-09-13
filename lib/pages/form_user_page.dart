import 'package:flutter/material.dart';
import 'package:flutterapp/models/user_model.dart';
import 'package:flutterapp/repository/users_repository.dart';
import 'package:flutterapp/l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;
    
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
        SnackBar(content: Text(l10n.userUpdatedSuccess)), 
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.userUpdateError(e.toString())))); 
    }
  }

  saveUser() async {
    final l10n = AppLocalizations.of(context)!;
    
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
        SnackBar(content: Text(l10n.userCreatedSuccess)),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.userCreateError(e.toString()))));
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
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.userEdit != null ? l10n.editUser : l10n.newUser,
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
                    return l10n.nameRequired;
                  }
                  if (value.length < 2) {
                    return l10n.nameMinLength;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: l10n.nameHint, 
                  labelText: l10n.nameLabel, 
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: txtEmailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.emailRequired; 
                  }
                  if (!RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  ).hasMatch(value)) {
                    return l10n.emailInvalid; 
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: l10n.emailHint,
                  labelText: l10n.emailLabel, 
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: txtPhotoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.photoUrlRequired; 
                  }

                  final uri = Uri.tryParse(value);
                  if (uri == null || !uri.hasScheme) {
                    return l10n.photoUrlInvalid; 
                  }

                  return null;
                },
                decoration: InputDecoration(
                  hintText: l10n.photoUrlHint, 
                  labelText: l10n.photoUrlLabel,
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
                    widget.userEdit != null ? l10n.update : l10n.save,
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