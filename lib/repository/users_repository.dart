import 'dart:convert';

import 'package:flutterapp/core/constants.dart';
import 'package:flutterapp/models/user_model.dart';
import 'package:http/http.dart' as http;

class UsersRepository {
  final urlBaseApi = "${baseURLMockApi}users";

  Future<List<UserModel>> getUsers() async {
    final List<UserModel> usersList = [];

    final response = await http.get(Uri.parse(urlBaseApi));

    if (response.statusCode == 200) {
      final List<dynamic> usersJson = jsonDecode(response.body);

      for (var user in usersJson) {
        usersList.add(UserModel.fromJson(user));
      }
    } else {
      throw Exception("Problemas ao carregar usuários");
    }

    return usersList;
  }
}
