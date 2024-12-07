import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _ResponsiveLoginPageState();
}

class _ResponsiveLoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false; // Toggle for password visibility
  bool _isVerifyPasswordVisible =
      false; // Toggle for verify password visibility
  bool _isChecked = false; // Checkbox state

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Allows content to adjust on keyboard appearance
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss keyboard on outside tap
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Center(
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    height: screenWidth * 0.3,
                    color: Colors.purple,
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Welcome Text
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Create an account to get',
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      Text(
                        'started!',
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

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

                SizedBox(height: screenHeight * 0.02),

                // Password TextField with visibility toggle
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.purple),
                    prefixIcon: Icon(Icons.lock, color: Colors.purple),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                ),

                SizedBox(height: screenHeight * 0.02),

                // Verify Password TextField with visibility toggle
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Verify Password',
                    labelStyle: const TextStyle(color: Colors.purple),
                    prefixIcon: const Icon(Icons.lock, color: Colors.purple),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isVerifyPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        setState(() {
                          _isVerifyPasswordVisible = !_isVerifyPasswordVisible;
                        });
                      },
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                  obscureText: !_isVerifyPasswordVisible,
                ),

                SizedBox(height: screenHeight * 0.03),

                // Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "I agree to the Terms and Conditions and Privacy Policy",
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                  ],
                ),

                // Sign Up Button
                ElevatedButton(
                  onPressed: _isChecked
                      ? () {
                          // Handle account creation logic
                          print("Account created");
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Create account',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Divider and Social Login Text
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.purple,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(
                            color: Colors.black, fontSize: screenWidth * 0.04),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.purple,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.02),

                // Social Login Buttons
                Column(
                  children: [
                    SignInButton(
                      Buttons.google,
                      onPressed: () {
                        print("Google login pressed");
                      },
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    SignInButton(
                      Buttons.facebook,
                      onPressed: () {
                        print("Facebook login pressed");
                      },
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    SignInButton(
                      Buttons.apple,
                      onPressed: () {
                        print("Apple login pressed");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
