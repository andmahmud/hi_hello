import 'package:HiHello/loginpage.dart';
import 'package:HiHello/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For the logo

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

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

    void _showsignupModal(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ClonedLoginPage(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 174, 30, 200),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: SvgPicture.asset(
                  'assets/images/logo.svg', // Path to your SVG logo
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(height: 30),

              // Description Text
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
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
                          'The Platform for Digital Brands and',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Identity!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Get Started Button
              ElevatedButton(
                onPressed: () => _showsignupModal(context), // Show signup modal
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
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
                        color: Colors.white,
                        fontSize: 16,
                      ),
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
