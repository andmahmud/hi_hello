import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            elevation: 5,
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Large image with refined shape
                  Container(
                    width: 140, // Image width
                    height: 140, // Image height
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/image2.png'), // Ensure this image is available in your assets
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(
                          15), // Rounded corners for the image
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12), // Space between image and name

                  // Name and title below the image
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Software Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                      height: 16), // Space between name and contact info

                  // Divider for separation
                  const Divider(),

                  // Contact details
                  const ListTile(
                    leading: Icon(Icons.email),
                    title: Text('john.doe@example.com'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('+ 567 890'),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20), // Space between the card and the button

          // Share button placed outside the card with rounded corners and purple background
          Container(
            width: double
                .infinity, // To ensure it stretches across the available width
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple, // Set text color to white
                padding: const EdgeInsets.symmetric(
                    vertical: 14.0), // Padding inside the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Rounded corners with 10% radius
                ),
                elevation: 5, // Add shadow to the button for a 3D effect
              ),
              onPressed: () {
                print('Share button pressed');
                // Handle share action here
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 8),
                  Text(
                    'SHARE',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
