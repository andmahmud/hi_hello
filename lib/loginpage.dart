import 'package:HiHello/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg package
import 'package:sign_in_button/sign_in_button.dart'; // Import sign_in_button package

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailFilled = false;

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
          child: Signuppage(),
        ),
      );
    }

    // Get screen width and height for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo with color customization (for SVG logo)
          Center(
            child: SvgPicture.asset(
              'assets/images/logo.svg', // Replace with your SVG logo path
              height: screenWidth * 0.3, // Responsive logo size
              color: Colors.purple, // Apply purple color to the logo
            ),
          ),
          SizedBox(height: 10),

          // Heading Text with custom purple color
          const Text(
            'Log In to your account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purple, // Custom purple color for heading
            ),
            textAlign: TextAlign.center,
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
          SizedBox(height: 10),

          // Email Field
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle:
                  TextStyle(color: Colors.purple), // Custom purple label color
              prefixIcon: Icon(Icons.email, color: Colors.purple), // Icon color
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _isEmailFilled = value.isNotEmpty;
              });
            },
          ),
          SizedBox(height: 10),

          // Password Field (Only visible when email is filled)
          if (_isEmailFilled)
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: Colors.purple), // Custom purple label color
                prefixIcon:
                    Icon(Icons.lock, color: Colors.purple), // Icon color
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
              obscureText: true,
            ),

          SizedBox(height: 10),

          // Log In Button with purple color
          ElevatedButton(
            onPressed: () {
              // Handle login
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple, // Button color (purple)
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
            child: const Text(
              'Submit',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white, // Text color inside the button
              ),
            ),
          ),
          SizedBox(height: 10),

          const Text(
            'Or continue With',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black, // Custom purple color for heading
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 10),

          // Social Media Login Buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SignInButton(
                  Buttons.google,
                  onPressed: () {
                    // Handle Google login
                    print("Google login pressed");
                  },
                  padding: EdgeInsets.all(5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SignInButton(
                  Buttons.facebook,
                  onPressed: () {
                    // Handle Google login
                    print("Google login pressed");
                  },
                  padding: EdgeInsets.all(6),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SignInButton(
                  Buttons.apple,
                  onPressed: () {
                    // Handle Google login
                    print("Google login pressed");
                  },
                  padding: EdgeInsets.all(6),
                ),
              ),
              SizedBox(width: 20),
              // Facebook Button with purple background
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SignInButton(
                  Buttons.microsoft,
                  onPressed: () {
                    // Handle Facebook login
                    print("Facebook login pressed");
                  },
                  padding: EdgeInsets.all(6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
