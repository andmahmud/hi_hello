import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClonedLoginPage extends StatelessWidget {
  const ClonedLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    void _showsignupModal(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ClonedLoginPage(),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo
          Center(
            child: SvgPicture.asset(
              'assets/images/logo.svg', // Replace with your SVG logo path
              height: 120, // Adjust the height
              color: Colors.purple, // Optional: Apply a color to the logo
            ),
          ),

          const SizedBox(height: 10),

          // Welcome Text
          const Center(
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Create an account to get',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  Text(
                    'started!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          GestureDetector(
            onTap: () => _showsignupModal(context),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: Center(
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Email TextField
          const TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.purple),
              prefixIcon: Icon(Icons.email, color: Colors.purple),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Password TextField
          const TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.purple),
              prefixIcon: Icon(Icons.lock, color: Colors.purple),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
            obscureText: true, // Hide the password
          ),
          const SizedBox(height: 10),

          const TextField(
            decoration: InputDecoration(
              labelText: 'Verify Password ',
              labelStyle: TextStyle(color: Colors.purple),
              prefixIcon: Icon(Icons.lock, color: Colors.purple),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
            obscureText: true, // Hide the password
          ),

          const SizedBox(height: 20),

          // Login Button
          ElevatedButton(
            onPressed: () {
              // Handle login logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Log In',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),

          const SizedBox(height: 10),

          // Sign Up Link
          GestureDetector(
            onTap: () {
              // Navigate to Sign Up Page
            },
            child: const Center(
              child: Text(
                'Don’t have an account? Sign Up',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.purple,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
