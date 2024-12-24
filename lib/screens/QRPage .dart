import 'package:HiHello/screens/CountryCode.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatefulWidget {
  final String qrData; // To hold the data passed from the CardsPage

  const QRPage({super.key, required this.qrData});

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  bool isEmailMode = false; // Toggle between Email and Message modes
  bool isQRMode = true; // QR Code is active by default

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
          children: [
            // Section Title (Always Constant)
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

            // Conditional Content
            if (isQRMode)
              _buildQRCodeContent() // QR Code Content
            else if (isEmailMode)
              _buildEmailContent() // Email Page Content
            else
              _buildMessageContent(), // Message Page Content

            const Spacer(),
            // Bottom Navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isQRMode = false;
                      isEmailMode = true;
                    });
                  },
                  icon: Icon(
                    Icons.email,
                    color: isEmailMode ? Colors.black : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isQRMode = true;
                      isEmailMode = false;
                    });
                  },
                  icon: Icon(
                    Icons.qr_code,
                    color: isQRMode ? Colors.black : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isQRMode = false;
                      isEmailMode = false;
                    });
                  },
                  icon: Icon(
                    Icons.message,
                    color:
                        !isQRMode && !isEmailMode ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildQRCodeContent() {
    return Center(
      child: Container(
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
          data: widget.qrData,
          size: 200,
          embeddedImage: const AssetImage('assets/images/logo.png'),
          embeddedImageStyle: const QrEmbeddedImageStyle(size: Size(40, 40)),
          gapless: false,
        ),
      ),
    );
  }

  Widget _buildEmailContent() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(child: Text("Email Your Card")),
        TextField(
          decoration: InputDecoration(
            labelText: "Name",
            hintText: "Name",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "name@email.com",
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: "Include a message ",
            hintText: "Include a message ",
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildMessageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: "Name",
            hintText: "Name",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            CountryCodeDropdown(
              onCountrySelected: (selectedCode) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRPage(qrData: selectedCode),
                  ),
                );
              },
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Phone number",
                  hintText: "Phone number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(
            labelText: "Include a message (optional)",
            hintText: "Include a message (optional)",
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Switch(value: false, onChanged: (value) {}),
                      const Text("Hide your number"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Switch(value: false, onChanged: (value) {}),
                      const Text("Send via WhatsApp"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
