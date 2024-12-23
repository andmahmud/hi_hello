import 'package:flutter/material.dart';

class Scanpage extends StatefulWidget {
  const Scanpage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScanpageState createState() => _ScanpageState();
}

class _ScanpageState extends State<Scanpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera_alt,
                size: 80,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Scan any contact information",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "Scan a business card and instantly\ncreate a digital contact with our AI.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              label: const Text("Scan"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 130, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
