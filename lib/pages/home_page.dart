import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterapp/pages/form_user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> userList = ["user 1", "user 2", "user 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de usuários")),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Slidable(
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
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
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(child: Text("US")),
                title: Text(userList[index]),
                subtitle: Text("email@email.com"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => FormUserPage()
            ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
