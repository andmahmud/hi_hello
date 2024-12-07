import 'dart:math';

import 'package:flutter/material.dart';

class Newpage extends StatefulWidget {
  const Newpage({Key? key}) : super(key: key);

  @override
  _FunnyAnimationPageState createState() => _FunnyAnimationPageState();
}

class _FunnyAnimationPageState extends State<Newpage> {
  double _width = 100;
  double _height = 100;
  double _opacity = 1.0;
  double _rotation = 0;
  Color _color = Colors.purple;

  // Toggle animation state with some randomness
  void _animate() {
    setState(() {
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
      _opacity = _opacity == 1.0 ? 0.5 : 1.0;
      _rotation = _rotation == 0 ? pi / 4 : 0; // 45-degree rotation
      _color =
          _color == Colors.teal ? Colors.blue : Colors.teal; // Change color
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Animation Page'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _animate, // Trigger animation on tap
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 1),
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: _width,
              height: _height,
              color: _color,
              curve: Curves.easeInOut,
              transform: Matrix4.rotationZ(_rotation), // Apply rotation
              child: const Center(
                child: Text(
                  'Tap Me!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
