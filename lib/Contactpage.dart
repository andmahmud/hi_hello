import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController _searchController = TextEditingController();
  bool _isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _isTextEmpty = _searchController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Field
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
                    suffixIcon: !_isTextEmpty
                        ? IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () {
                              _searchController.clear();
                            },
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Filter Buttons
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
              // Contact List
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
        backgroundImage: AssetImage('assets/images/profile.png'),
        radius: 24.0,
      ),
      title: Text(name),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Curved Background
                ClipPath(
                  clipper: CustomCurveClipper(),
                  child: Container(
                    height: 300,
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
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Engr. Mahmudul Hasan',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: ' Ph.D.',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
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
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'HiHello is a software platform for digital brand and identity that enables individuals and companies of all sizes to leverage digital business cards, email signatures & virtual backgrounds to present their brand.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Goes by Manu (he/him/his)",
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.all(
                          8.0), // Removed 'const' from this Padding
                      child: Row(
                        children: [
                          Icon(Icons.security, color: Colors.blue),
                          SizedBox(width: 8),
                          Text("SOC 2 TYPE 2"),
                          SizedBox(width: 16),
                          Icon(Icons.gpp_good, color: Colors.blue),
                          SizedBox(width: 8),
                          Text("GDPR Ready"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            buildInfoTile(Icons.location_on, "Palo Alto, California", "work"),
            buildInfoTile(Icons.email, "support@hihello.com"),
            buildInfoTile(Icons.description, "The Business Card. Reimagined."),
            buildInfoTile(
                Icons.credit_card, "HiHello Professional (for individuals)"),
            buildInfoTile(Icons.credit_card,
                "HiHello Business (for small to medium businesses)"),
            buildInfoTile(Icons.credit_card,
                "HiHello Enterprise (for medium-large organizations)"),
            buildInfoTile(Icons.link, "www.hihello.com"),
            buildInfoTile(
                Icons.social_distance, "Follow @ManuKumar on Twitter"),
            const SizedBox(height: 16),
            const Divider(),
            buildSectionTitle("Tags"),
            ListTile(
              title: Text(
                "No tags for this contact yet.",
                style: TextStyle(color: Colors.grey[600]),
              ),
              trailing: const Icon(Icons.add),
              onTap: () {
                // Add tag logic
              },
            ),
            const Divider(),
            buildSectionTitle("Notes"),
            ListTile(
              title: Text(
                "No notes for this contact yet.",
                style: TextStyle(color: Colors.grey[600]),
              ),
              trailing: const Icon(Icons.add),
              onTap: () {
                // Add note logic
              },
            ),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildSectionTitle(
                    "Connection"), // Custom method to create section title
                const ListTile(
                  leading: Icon(Icons.link),
                  title: Text(
                      "Added Dec 2, 2024, 6:59 PM"), // Use title here for the time
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 2.0), // Smaller padding
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Border around the box
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
              constraints: const BoxConstraints(
                maxWidth: 330, // Set a maximum width for the container
              ),
              height: 70, // Fixed height for the container
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                      height: 8.0), // Space between title and dropdown
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Associated Card",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      DropdownButton<String>(
                        value: "New Card", // Default selected value
                        items: const [
                          DropdownMenuItem(
                            value: "New Card",
                            child: Text("New Card"),
                          ),
                          DropdownMenuItem(
                            value: "Old Card",
                            child: Text("Old Card"),
                          ),
                          DropdownMenuItem(
                            value: "No Card",
                            child: Text("No Card"),
                          ),
                        ],
                        onChanged: (String? newValue) {
                          // Handle the change and update the active card
                          print("Selected: $newValue");
                        },
                        isExpanded:
                            false, // Keeps the dropdown at its default size
                        underline: Container(), // Removes default underline
                        icon: const Icon(
                            Icons.arrow_drop_down), // Down arrow for dropdown
                      ),
                    ],
                  ),
                  const SizedBox(
                      height:
                          8.0), // Space between the dropdown and any following content
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String title, [String? subtitle]) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
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

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
