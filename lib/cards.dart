import 'package:flutter/material.dart';

class CardData {
  final String name;
  final String role;
  final String company;
  final String email;
  final String phone;
  final String imageUrl;
  final String socialLink;

  CardData({
    required this.name,
    required this.role,
    required this.company,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.socialLink,
  });
}

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  int _currentIndex = 0; // To track the current card index

  final List<Color> _buttonColors = [
    Colors.purple,
    const Color.fromARGB(255, 88, 23, 118),
  ]; // Colors for each card's SHARE button

  final List<CardData> cards = [
    CardData(
      name: "MD MAHMUD HASAN",
      role: "Software Engineer",
      company: "Skz",
      email: "skillerszonetanvir@gmail.com",
      phone: "7650247",
      imageUrl: 'assets/images/image.png',
      socialLink: "https://facebook.com",
    ),
    CardData(
      name: "MAHMUD",
      role: "UI/UX Designer",
      company: "Creative Studio",
      email: "jane.doe@example.com",
      phone: "123456789",
      imageUrl: 'assets/images/image.png',
      socialLink: "https://linkedin.com",
    ),
  ]; // Card data

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(" Cards"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              print('Add button pressed');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Added for top-to-bottom scroll
        child: Column(
          children: [
            // Horizontal scrolling PageView for the cards
            SizedBox(
              height: 550, // Set a fixed height to ensure scrollability
              child: PageView.builder(
                controller: PageController(
                    viewportFraction: screenWidth > 600 ? 0.6 : 0.85),
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index; // Update the current index
                  });
                },
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8), // Space between cards
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                child: Image.asset(
                                  cards[index].imageUrl,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                        child: Icon(Icons
                                            .error)); // Handle image load errors
                                  },
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      "NEW", // You can change the text dynamically based on conditions
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cards[index].name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  cards[index].role,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                Text(
                                  cards[index].company,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    const Icon(Icons.email, color: Colors.grey),
                                    const SizedBox(width: 8),
                                    Text(cards[index].email),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const Row(
                                  children: [
                                    Icon(Icons.facebook, color: Colors.grey),
                                    SizedBox(width: 8),
                                    Text(
                                        "Facebook"), // Change this to dynamic social link text
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.phone_android,
                                        color: Colors.grey),
                                    const SizedBox(width: 8),
                                    Text(cards[index].phone),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Constant SHARE button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      _buttonColors[_currentIndex], // Dynamic color
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 50.0), // Updated padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  minimumSize:
                      const Size(double.infinity, 50), // Make button full width
                ),
                onPressed: () {
                  print('Share button pressed for card $_currentIndex');
                },
                child: const Text(
                  'SHARE',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
