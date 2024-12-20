import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatelessWidget {
  final String qrData; // To hold the data passed from the CardsPage

  // Constructor to accept the card's URL
  const QRPage({super.key, required this.qrData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Section Title
            const Text(
              'SHARING',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'WORK CARD',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            // QR Code
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: QrImageView(
                data:
                    qrData, // Use the dynamic data passed from CardsPage (Card's URL)
                size: 200,
                embeddedImage: const AssetImage(
                    'assets/images/logo.png'), // Add your embedded image
                embeddedImageStyle:
                    const QrEmbeddedImageStyle(size: Size(40, 40)),
                gapless: false,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tap QR code to go offline',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            // Share Button
            ElevatedButton.icon(
              onPressed: () {
                // You can implement sharing functionality here using packages like 'share'
              },
              icon: const Icon(Icons.share_rounded),
              label: const Text('Share'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                      color: Colors.grey, width: 1), // Add border here
                ),
                minimumSize: const Size(
                    250, 50), // Set the width and height for the button
              ),
            ),

            const Spacer(),
            // Bottom Navigation (with actions for email, QR scan, and messaging)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    // Add email functionality, e.g., open email client
                  },
                  icon: const Icon(Icons.email),
                ),
                IconButton(
                  onPressed: () {
                    // Add QR scan functionality
                  },
                  icon: const Icon(Icons.qr_code),
                ),
                IconButton(
                  onPressed: () {
                    // Add messaging functionality
                  },
                  icon: const Icon(Icons.message),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
