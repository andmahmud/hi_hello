import 'package:HiHello/newpage.dart';
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
  final TextEditingController _passwordController = TextEditingController();
  bool _isEmailSubmitted = false; // To control when the email is submitted
  bool _isPasswordVisible = false; // Control visibility of the password field
// To control when the password is submitted
  String? _submittedEmail;
  String? _errorMessage;

  // Email Validation Regex
  bool _isValidEmail(String email) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  // Password Validation
  bool _isValidPassword(String password) {
    return password.length >=
        6; // Ensure the password is at least 6 characters long
  }

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
          child: LoginPage(),
        ),
      );
    }

    // Get screen width and height for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Prevents page from resizing when keyboard appears
      body: SingleChildScrollView(
        // Add SingleChildScrollView here for scrolling
        child: Padding(
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
                      'Don’t have an account? Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Email Field (only visible when not submitted)
              if (!_isEmailSubmitted)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Enter your email', // Updated label text
                      labelStyle: const TextStyle(
                        color: Colors.purple, // Custom purple label color
                      ),
                      prefixIcon: const Icon(Icons.email,
                          color: Colors.purple), // Icon color
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)), // Border radius of 10
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)), // Border radius of 10
                      ),
                      errorText: _errorMessage, // Show error message if present
                    ),
                    onChanged: (value) {
                      setState(() {
                        _errorMessage = null; // Clear error when the user types
                      });
                    },
                  ),
                ),

              SizedBox(height: 10),

              // Submit Button
              if (!_isEmailSubmitted)
                ElevatedButton(
                  onPressed: () {
                    // Validate Email
                    if (_isValidEmail(_emailController.text)) {
                      setState(() {
                        _submittedEmail = _emailController.text; // Store email
                        _isEmailSubmitted =
                            true; // Hide the email field after submit
                      });
                    } else {
                      setState(() {
                        _errorMessage = 'Please enter a valid email address';
                      });
                    }
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

              // Show the submitted email after "Submit" button is clicked
              if (_isEmailSubmitted)
                Center(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center both icon and text
                    children: [
                      Icon(
                        Icons.arrow_forward, // The icon you want to display
                        color: Colors.purple, // Purple color for the icon
                        size: 20, // Adjust the size of the icon
                      ),
                      SizedBox(width: 8), // Space between the icon and text
                      Text(
                        '$_submittedEmail', // Display the submitted email
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.purple, // Purple color for the text
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

              SizedBox(height: 10),

              // Password Field (Only visible after clicking Submit)
              if (_isEmailSubmitted)
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.purple), // Custom purple label color
                    prefixIcon:
                        Icon(Icons.lock, color: Colors.purple), // Icon color
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off, // Visibility icon
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible =
                              !_isPasswordVisible; // Toggle password visibility
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    errorText:
                        _errorMessage, // Show error message if password is invalid
                  ),
                  onChanged: (value) {
                    setState(() {
                      _errorMessage = null; // Clear error when the user types
                    });
                  },
                ),

              SizedBox(height: 10),

              // Submit Button for Password (Below password field)
              if (_isEmailSubmitted)
                ElevatedButton(
                  onPressed: () {
                    // Validate Password
                    if (_isValidPassword(_passwordController.text)) {
                      setState(() {
// Hide password field after submit
                      });
                    } else {
                      setState(() {
                        _errorMessage =
                            'Password must be at least 6 characters';
                      });
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => newpage()),
                    );
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

              // Or continue with social media login buttons
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Row with left and right dividers
                  Row(
                    children: [
                      // Divider on the left side
                      Expanded(
                        child: Divider(
                          color: Colors.purple, // Color of the line
                          thickness: 1, // Thickness of the line
                          indent: 20, // Space before the line starts
                        ),
                      ),

                      // Text in the center
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0), // Space between line and text
                        child: Text(
                          'Or continue With',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // Divider on the right side
                      Expanded(
                        child: Divider(
                          color: Colors.purple, // Color of the line
                          thickness: 1, // Thickness of the line
                          endIndent: 20, // Space after the line ends
                        ),
                      ),
                    ],
                  ),
                ],
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
                        // Handle Facebook login
                        print("Facebook login pressed");
                      },
                      padding: EdgeInsets.all(6),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SignInButton(
                      Buttons.apple,
                      onPressed: () {
                        // Handle Apple login
                        print("Apple login pressed");
                      },
                      padding: EdgeInsets.all(6),
                    ),
                  ),
                  SizedBox(width: 20),
                  // Microsoft Button
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SignInButton(
                      Buttons.microsoft,
                      onPressed: () {
                        // Handle Microsoft login
                        print("Microsoft login pressed");
                      },
                      padding: EdgeInsets.all(6),
                    ),
                  ),
                ],
              ),

              SizedBox(width: 20),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Centers the row content horizontally
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Centers the column content vertically
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Ensures text is centered inside the column
                      children: [
                        Text(
                          'Having trouble logging in?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 2),

              GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 0.0),
                  child: Center(
                    child: Text(
                      'Contact us',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Centers the row content horizontally
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Centers the column content vertically
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Ensures text is centered inside the column
                      children: [
                        Text(
                          'By Continuing, you acknowledge that you have read',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Understood,and agree to our terms and aconditions.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
