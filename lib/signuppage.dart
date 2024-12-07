import 'package:HiHello/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SimpleLoginPage extends StatefulWidget {
  const SimpleLoginPage({super.key});

  @override
  State<SimpleLoginPage> createState() => _SimpleLoginPageState();
}

class _SimpleLoginPageState extends State<SimpleLoginPage> {
  bool _isPasswordVisible = false; // Toggle for password visibility
  bool _isVerifyPasswordVisible =
      false; // Toggle for verify password visibility
  bool _isChecked = false; // Checkbox state

  @override
  Widget build(BuildContext context) {
    void _showloginModal(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: LoginForm(),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent resizing when keyboard appears
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss keyboard on outside tap
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Center(
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    height: 120, // Fixed logo height
                    color: Colors.purple,
                  ),
                ),

                const SizedBox(height: 20),

                // Welcome Text
                const Center(
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
                SizedBox(height: 20),

                GestureDetector(
                  onTap: () => _showloginModal(context),
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 0.0),
                    child: Center(
                      child: Text(
                        'Already have an account? Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Email TextField
                const SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your Email',
                      labelStyle: TextStyle(color: Colors.purple),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Password TextField with visibility toggle
                SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.purple),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
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
                ),

                const SizedBox(height: 20),

                // Verify Password TextField with visibility toggle
                SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Verify Password',
                      labelStyle: const TextStyle(color: Colors.purple),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isVerifyPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.purple,
                        ),
                        onPressed: () {
                          setState(() {
                            _isVerifyPasswordVisible =
                                !_isVerifyPasswordVisible;
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
                ),

                const SizedBox(height: 20),

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
                    const Expanded(
                      child: Text(
                        "I agree to the Terms and Conditions and Privacy Policy",
                        style: TextStyle(fontSize: 14),
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
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Create account',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 20),

                // Divider and Social Login Text
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.purple,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.purple,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Social Login Buttons
                Column(
                  children: [
                    SignInButton(
                      Buttons.google,
                      onPressed: () {
                        print("Google login pressed");
                      },
                    ),
                    const SizedBox(height: 10),
                    SignInButton(
                      Buttons.apple,
                      onPressed: () {
                        print("Facebook login pressed");
                      },
                    ),
                    const SizedBox(height: 10),
                    SignInButton(
                      Buttons.microsoft,
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
