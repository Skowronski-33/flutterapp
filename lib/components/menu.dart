import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('API - XX'),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text('Tema novo do Flutter'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
