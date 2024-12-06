import 'package:HiHello/loginpage.dart';
import 'package:HiHello/signuppage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Started Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 174, 30, 200), // Background color of the page
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0), // Horizontal padding
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align the content at the top
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo Very Close to the Top
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0), // No padding to make logo as close as possible
                child: Image.asset(
                  'assets/images/logo.png', // Path to your logo
                  height: 350, // Large height for the logo
                  width: 350, // Large width for the logo
                ),
              ),
              const SizedBox(height: 30), // Space after the logo

              // Title text with color
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    'The Platform for Digital Brands and Identity!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,

                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Get Started button with custom color
              ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button color
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 90,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.black, // Button text color
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Login link with color and underline
              GestureDetector(
                onTap: () {
                  // Use onTap instead of onPressed for GestureDetector
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const loginPage()), // Navigate to LoginPage
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 0.0),
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(
                      color: Colors.white, // Link color
                      fontSize: 16,
                      decoration: TextDecoration
                          .underline, // Optional: makes the text underlined like a link
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
