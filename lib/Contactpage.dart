import 'package:flutter/material.dart';

class Contactpage extends StatelessWidget {
  const Contactpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              print('Add button pressed');
            },
          ),
        ],
      ),
    );
  }
}
