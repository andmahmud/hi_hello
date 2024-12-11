import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover"),
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
