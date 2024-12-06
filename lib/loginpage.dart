import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<loginPage> {
  // Text editing controller for the email input
  final TextEditingController _emailController = TextEditingController();

  // Global key for the form
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Function to handle login (just a print for now)
  void _login() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logging in with ${_emailController.text}')),
      );
      // You can add navigation or logic for actual login here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Email Input Field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    // Email validation logic
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Basic email format validation
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Login Button
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Link to "Don't have an account?" page (optional)
                GestureDetector(
                  onTap: () {
                    // Navigate to the registration page or show a message
                    print("Navigate to sign-up page");
                  },
                  child: const Text(
                    'Don\'t have an account? Sign up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
