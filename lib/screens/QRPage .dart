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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              const SizedBox(height: 50),

              if (isQRMode)
                _buildQRCodeContent() // QR Code Content
              else if (isEmailMode)
                _buildEmailContent() // Email Page Content
              else
                _buildMessageContent(), // Message Page Content

              const SizedBox(height: 40),
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
                      color: !isQRMode && !isEmailMode
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQRCodeContent() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
              data: widget.qrData,
              size: 200,
              embeddedImage: const AssetImage('assets/images/logo.png'),
              embeddedImageStyle:
                  const QrEmbeddedImageStyle(size: Size(40, 40)),
              gapless: false,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Tab QR Code to go offline",
            style: TextStyle(
              // Add your share functionality here icon: const Icon(Icons.share),
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            // width: double.infinity, // Full width
            child: OutlinedButton.icon(
              onPressed: () {
                // Your functionality here
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    color: Colors.grey, width: 2), // Border color and width
                padding: const EdgeInsets.symmetric(
                  vertical: 15, // Reduce vertical padding for a smaller box
                  horizontal: 80, // Adjust horizontal padding
                ),
              ),
              icon: const Icon(Icons.share,
                  color: Colors.black, size: 30), // Bigger icon
              label: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 20, // Slightly smaller text size
                  color: Colors.black, // Text color
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildEmailContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Center(
          child: Text(
            "Email Your Card",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Sent to",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            hintText: "Name",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            hintText: "name@email.com",
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 30),
        const Text(
          "Include a message(Optional)",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            hintText: "Include a message(Optional) ",
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) =>  ()),
            // );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color.fromARGB(255, 4, 74, 132), // Button color (purple)
            padding: const EdgeInsets.symmetric(vertical: 8),
          ),
          child: const Text(
            'Submit',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white, // Text color inside the button
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildMessageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        const Text(
          "Sent to",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),
        const TextField(
          decoration: InputDecoration(
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
                  hintText: "Phone number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          "Include a message (optional)",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            hintText: "Include a message (optional)",
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Switch(value: false, onChanged: (value) {}),
                      const Text("Hide your number"),
                    ],
                  ),
                  Row(
                    children: [
                      Switch(value: false, onChanged: (value) {}),
                      const Text("Send via WhatsApp"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) =>  ()),
            // );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color.fromARGB(255, 4, 47, 82), // Button color (purple)
            padding: const EdgeInsets.symmetric(vertical: 8),
          ),
          child: const Text(
            'SEND',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white, // Text color inside the button
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
