import 'package:flutter/material.dart';

class Contactpage extends StatefulWidget {
  const Contactpage({Key? key}) : super(key: key);

  @override
  _ContactpageState createState() => _ContactpageState();
}

class _ContactpageState extends State<Contactpage> {
  TextEditingController _searchController =
      TextEditingController(); // TextController to manage input
  bool _isTextEmpty = true; // Flag to check if the text is empty

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        // Update flag when the text changes
        _isTextEmpty = _searchController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController
        .dispose(); // Dispose the controller when the widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Wrap the entire body with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Field with Cancel Button
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search contacts',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    // Add suffix icon only if text is entered
                    suffixIcon: !_isTextEmpty
                        ? IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () {
                              _searchController
                                  .clear(); // Clear the text field when cancel is tapped
                            },
                          )
                        : null,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Filter buttons (you can add your filter buttons here)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HorizontalFilterButton(
                      label: 'Filters', icon: Icons.filter_list),
                  HorizontalFilterButton(
                      label: 'Live Contacts', icon: Icons.contact_page),
                  HorizontalFilterButton(label: 'Scanned', icon: Icons.qr_code),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'DEC 2024',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              const SizedBox(height: 8.0),
              // List of contacts (you can add dynamic contact tiles here)
              _buildContactTile(
                  'Mahmudul Hasan', 'HiHello, Inc. | Co-founder & CEO'),
              const SizedBox(height: 8.0),
              _buildContactTile(
                  'Mahmudul Hasan', 'HiHello, Inc. | Co-founder & CEO'),
              const SizedBox(height: 8.0),
              _buildContactTile(
                  'Mahmudul Hasan', 'HiHello, Inc. | Co-founder & CEO'),
              const SizedBox(height: 8.0),
              _buildContactTile(
                  'Mahmudul Hasan', 'HiHello, Inc. | Co-founder & CEO'),
              const SizedBox(height: 8.0),
              _buildContactTile(
                  'Mahmudul Hasan', 'HiHello, Inc. | Co-founder & CEO'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactTile(String name, String subtitle) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage(
            'assets/images/profile.png'), // Replace with actual image
        radius: 24.0,
      ),
      title: Text(name),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      },
    );
  }
}

class HorizontalFilterButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const HorizontalFilterButton({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18.0),
          const SizedBox(width: 8.0),
          Text(
            label,
            style: const TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahmudul Hasan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              // Curved background with the image
              ClipPath(
                clipper: CustomCurveClipper(),
                child: Container(
                  height: 300, // Height of the curved container
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Name, Title, and Company
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Engr.Mahmudul Hasan',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.black, // Make sure to set the color for TextSpan
                  ),
                ),
                TextSpan(
                  text: ' Ph.D.',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors
                        .black, // Match the color for consistent appearance
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          const Text(
            'Co-founder & CEO',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 4),
          const Text(
            'HiHello, Inc.',
            style: TextStyle(
                fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          // Description
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'HiHello is a software platform for digital brand and identity that enables individuals and companies of all sizes to leverage digital business cards, email signatures & virtual backgrounds to present their brand.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50); // Start at bottom-left
    path.quadraticBezierTo(
      size.width / 2, // Control point X
      size.height, // Control point Y
      size.width, // End point X
      size.height - 50, // End point Y
    );
    path.lineTo(size.width, 0); // Go to the top-right corner
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
