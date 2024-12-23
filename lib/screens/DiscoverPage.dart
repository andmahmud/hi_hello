import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height:
                    280, // Set the height for the carousel to ensure consistency

                enlargeCenterPage: false, // Enlarge the center item
                enableInfiniteScroll: false, // Enable infinite scroll
                autoPlay: false, // Enable auto-play
                autoPlayInterval: Duration(seconds: 3), // Auto-play interval
                autoPlayAnimationDuration:
                    Duration(milliseconds: 800), // Auto-play animation duration
                viewportFraction: 0.8, // Control the fraction of viewport
              ),
              items: [
                // Trees saved globally section
                Container(
                  width:
                      double.infinity, // Ensures the container takes full width
                  height: 300, // Ensure all containers are the same height
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0), // Reduced padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Trees saved today, globally:',
                                    style: TextStyle(
                                        fontSize: 14), // Reduced font size
                                  ),
                                  SizedBox(height: 6), // Reduced spacing
                                  Text(
                                    '1.71',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight
                                            .bold), // Reduced font size
                                  ),
                                  SizedBox(height: 6), // Reduced spacing
                                ],
                              ),
                              Image.asset(
                                'assets/images/trees.png',
                                height: 60, // Reduced image size
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0), // Reduced padding
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: Icon(Icons.eco,
                                    color: Colors.green,
                                    size: 20), // Reduced icon size
                              ),
                              const SizedBox(height: 6), // Reduced spacing
                              const Text(
                                'We saved over 650 trees last year. Thanks for being part of HiHello’s sustainability efforts!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 11), // Reduced font size
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Learn More',
                                    style: TextStyle(
                                        fontSize: 11)), // Reduced font size
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Sustainability section
                Container(
                  width:
                      double.infinity, // Ensures the container takes full width
                  height: 300, // Ensure all containers are the same height
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0), // Reduced padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Trees saved today, globally:',
                                    style: TextStyle(
                                        fontSize: 14), // Reduced font size
                                  ),
                                  SizedBox(height: 6), // Reduced spacing
                                  Text(
                                    '1.71',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight
                                            .bold), // Reduced font size
                                  ),
                                  SizedBox(height: 6), // Reduced spacing
                                ],
                              ),
                              Image.asset(
                                'assets/images/trees.png',
                                height: 60, // Reduced image size
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0), // Reduced padding
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: Icon(Icons.eco,
                                    color: Colors.green,
                                    size: 20), // Reduced icon size
                              ),
                              const SizedBox(height: 6), // Reduced spacing
                              const Text(
                                'We saved over 650 trees last year. Thanks for being part of HiHello’s sustainability efforts!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 11), // Reduced font size
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Learn More',
                                    style: TextStyle(
                                        fontSize: 11)), // Reduced font size
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Sustainability section
                Container(
                  width:
                      double.infinity, // Ensures the container takes full width
                  height: 300, // Ensure all containers are the same height
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0), // Reduced padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Trees saved today, globally:',
                                    style: TextStyle(
                                        fontSize: 14), // Reduced font size
                                  ),
                                  SizedBox(height: 6), // Reduced spacing
                                  Text(
                                    '1.71',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight
                                            .bold), // Reduced font size
                                  ),
                                  SizedBox(height: 6), // Reduced spacing
                                ],
                              ),
                              Image.asset(
                                'assets/images/trees.png',
                                height: 60, // Reduced image size
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0), // Reduced padding
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: Icon(Icons.eco,
                                    color: Colors.green,
                                    size: 20), // Reduced icon size
                              ),
                              const SizedBox(height: 6), // Reduced spacing
                              const Text(
                                'We saved over 650 trees last year. Thanks for being part of HiHello’s sustainability efforts!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 11), // Reduced font size
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Learn More',
                                    style: TextStyle(
                                        fontSize: 11)), // Reduced font size
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Review section
            Card(
              margin: const EdgeInsets.all(19),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logo_play_store.png', // Replace with the actual path to your Play Store logo image
                          height: 32, // Adjust the size of the logo as needed
                          width: 32, // Adjust the width if necessary
                        ),
                        const SizedBox(
                            width:
                                8), // Add some spacing between the image and text
                        const Text(
                          'Leave a review on the Play Store!',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Let us know how we are doing by leaving a review on the Play Store.',
                      style: TextStyle(fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {}, // Add action
                      child: const Text('Take me there',
                          style: TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
              ),
            ),

            // Release notes
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What’s new?',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Release notes  Version 6.1.0',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Check out what’s new in HiHello!',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Section 2: Network Smarter with HiHello
            const Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligning children to start (top)
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Network Smarter with HiHello',
                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.left, // Text will start from the left
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  buildFeatureCard(
                    title: 'Email signatures',
                    imagePath: 'assets/images/image.png',
                    onTap: () {}, // Add action for onTap
                  ),
                  const SizedBox(width: 16),
                  buildFeatureCard(
                    title: 'Custom branding',
                    imagePath: 'assets/images/image.png',
                    onTap: () {}, // Add action for onTap
                  ),
                  const SizedBox(width: 16),
                  buildFeatureCard(
                    title: 'Custom branding',
                    imagePath: 'assets/images/image.png',
                    onTap: () {}, // Add action for onTap
                  ),
                  const SizedBox(width: 16),
                  buildFeatureCard(
                    title: 'Custom branding',
                    imagePath: 'assets/images/image.png',
                    onTap: () {}, // Add action for onTap
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Section 3: Need Help?
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 17.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey, width: 1.5),
                ),
                padding: const EdgeInsets.all(24),
                child: const Row(
                  children: [
                    Icon(
                      Icons.help_outline,
                      size: 30,
                      color: Colors.black,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Need Help?',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Learn more about how to use HiHello',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget buildFeatureCard({
    required String title,
    required String imagePath,
    required VoidCallback onTap, // Add a callback for tap
  }) {
    return GestureDetector(
      onTap: onTap, // This will trigger the onTap callback
      child: Container(
        width: 140, // Adjusted card width for a smaller size
        height: 190, // Adjusted card height for a smaller size
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            // Added border
            color: Colors.grey.withOpacity(0.3), // Light grey border
            width: 1.5, // Border width
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100, // Control the image height for consistent display
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title, // This can be any string like "Hello, Flutter!"
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
