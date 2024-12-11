import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.85),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index; // Update the current index
                });
              },
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Container(
                        width: double.infinity,
                        height: 550,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                  child: Image.asset(
                                    index == 0
                                        ? 'assets/images/image.png'
                                        : 'assets/images/image.png',
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
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
                                      child: Text(
                                        index == 0 ? "NEW" : "WOARK",
                                        style: const TextStyle(
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
                                    index == 0 ? "MD MAHMUD HASAN" : "MAHMUD",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    index == 0
                                        ? "Software Engineer"
                                        : "UI/UX Designer",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Text(
                                    index == 0 ? "Developer" : "Freelancer",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: index == 0
                                          ? Colors.blue
                                          : Colors.green,
                                    ),
                                  ),
                                  Text(
                                    index == 0 ? "Skz" : "Creative Studio",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      const Icon(Icons.email,
                                          color: Colors.grey),
                                      const SizedBox(width: 8),
                                      Text(index == 0
                                          ? "skillerszonetanvir@gmail.com"
                                          : "jane.doe@example.com"),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        index == 0
                                            ? Icons.facebook
                                            : Icons.facebook,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                          index == 0 ? "Facebook" : "LinkedIn"),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(Icons.phone_android,
                                          color: Colors.grey),
                                      const SizedBox(width: 8),
                                      Text(
                                          index == 0 ? "7650247" : "123456789"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                backgroundColor: _buttonColors[_currentIndex], // Dynamic color
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 50.0), // Updated padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                minimumSize:
                    Size(double.infinity, 50), // Make button full width
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
    );
  }
}
