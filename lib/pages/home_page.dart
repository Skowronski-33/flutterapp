import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterapp/components/menu.dart';
import 'package:flutterapp/models/user_model.dart';
import 'package:flutterapp/pages/form_user_page.dart';
import 'package:flutterapp/pages/user_view_page.dart';
import 'package:flutterapp/repository/users_repository.dart';
import 'package:flutterapp/services/user_service.dart';
import 'package:flutterapp/l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //instanciar a classe UsersRepository
  final repository = UsersRepository();
  
  //instanciar o UserService para as iniciais
  final userService = UserService();

  //lista de usuários
  late Future<List<UserModel>> userList;

  //obter a lista de usuários no repositório
  Future<List<UserModel>> fetchUsers() async {
    return await repository.getUsers();
  }

  deleteUser(String id) async {
    final l10n = AppLocalizations.of(context)!; 
    
    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(l10n.deleteConfirmTitle), 
        content: Text(l10n.deleteConfirmMessage), 
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context, 'Cancelar'),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () async {
              await repository.deleteUser(id);
              Navigator.pop(context);
            },
            child: Text(l10n.confirm), 
          ),
        ],
      ),
    );
    //após finalizar a exclusão, atualizar a lista de usuários
    setState(() {
      userList = fetchUsers();
    });
  }

  @override
  void initState() {
    userList = fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(title: Text(l10n.userListTitle)),
      drawer: Menu(),
      body: FutureBuilder(
        future: userList,
        builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(l10n.error(snapshot.error.toString()))); 
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text(l10n.noUsersFound));
          } else {
            return _buildUserList(snapshot.data);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormUserPage()),
          ).then((value) {
            setState(() {
              userList = fetchUsers();
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildUserList(userList) {
    final l10n = AppLocalizations.of(context)!;
    
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          child: Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FormUserPage(userEdit: userList[index]),
                      ),
                    );
                    setState(() {
                      this.userList = fetchUsers();
                    });
                  },
                  icon: Icons.edit,
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.black,
                  label: l10n.edit,
                ),
                SlidableAction(
                  onPressed: (context) {
                    deleteUser(userList[index].id);
                  },
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  label: l10n.delete,
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: userList[index].avatar != null && userList[index].avatar!.isNotEmpty
                    ? ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: userList[index].avatar!,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                          errorWidget: (context, url, error) => Text(
                            userService.initials(userList[index].name ?? ""),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : Text(
                        userService.initials(userList[index].name ?? ""),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
              ),
              title: Text(userList[index].name),
              subtitle: Text(userList[index].email ?? l10n.noEmail),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserViewPage(user: userList[index]),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}