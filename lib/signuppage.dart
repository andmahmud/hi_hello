import 'package:flutter/material.dart';

class Signuppage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Log In',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: 'Username'),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle login
              Navigator.pop(context);
            },
            child: Text('Log In'),
          ),
        ],
      ),
    );
  }
}
