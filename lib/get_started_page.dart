import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For the logo
import 'package:video_player/video_player.dart'; // For video player
import 'loginpage.dart'; // Ensure this imports the LoginForm widget
import 'signuppage.dart'; // Ensure this imports the Signuppage widget

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller with the video asset or network URL
    _controller = VideoPlayerController.asset('assets/videos/background.mp4')
      ..setLooping(true) // Makes the video loop
      ..setVolume(1.0); // Adjust volume (0.0 to 1.0)

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Dispose the controller when the widget is disposed
  }

  void _showLoginModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
        child: Signuppage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 174, 30, 200),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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

              // Video Player (Beneath the logo)
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return CircularProgressIndicator(); // Loading indicator while the video loads
                  }
                },
              ),
              const SizedBox(height: 20),

              // Description Text
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Column(
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
                ),
              ),
              const SizedBox(height: 40),

              // Get Started Button
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
              const SizedBox(height: 20),

              // Login Link
              GestureDetector(
                onTap: () => _showLoginModal(context),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 0.0),
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
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
