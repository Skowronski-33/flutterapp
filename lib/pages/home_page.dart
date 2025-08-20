import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterapp/models/user_model.dart';
import 'package:flutterapp/pages/form_user_page.dart';
import 'package:flutterapp/repository/users_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //instanciar a classe UsersRepository
  final repository = UsersRepository();

  //lista de usuários
  late Future<List<UserModel>> userList;

  //obter a lista de usuários no repositório
  Future<List<UserModel>> fetchUsers() async {
    return await repository.getUsers();
  }

  @override
  void initState() {
    userList = fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de usuários"),
      ),
      body: FutureBuilder(
        future: userList,
        builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Nenhum usuário encontrado"));
          } else {
            return _buildUserList(snapshot.data);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FormUserPage(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildUserList(userList) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          child: Slidable(
            endActionPane: ActionPane(motion: const ScrollMotion(), children: [
              SlidableAction(
                onPressed: (context) {},
                icon: Icons.edit,
                backgroundColor: Colors.grey,
                foregroundColor: Colors.black,
                label: "Editar",
              ),
              SlidableAction(
                onPressed: (context) {},
                icon: Icons.delete,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                label: "Excluir",
              )
            ]),
            child: ListTile(
              leading: CircleAvatar(
                child: userList[index].avatar != null
                    ? Image.network(userList[index].avatar)
                    : const Text("US"),
              ),
              title: Text(userList[index].name),
              subtitle: Text(userList[index].email ?? "Sem email"),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        );
      },
    );
  }
}
