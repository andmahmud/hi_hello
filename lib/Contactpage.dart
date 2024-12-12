import 'package:flutter/material.dart';

class Contactpage extends StatelessWidget {
  const Contactpage({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search contacts',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
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
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/profile.png'), // Replace with actual image
                radius: 24.0,
              ),
              title: const Text('Manu Kumar'),
              subtitle: const Text('HiHello, Inc. | Co-founder & CEO'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/profile.png'), // Replace with actual image
                radius: 24.0,
              ),
              title: const Text('Manu Kumar'),
              subtitle: const Text('HiHello, Inc. | Co-founder & CEO'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/profile.png'), // Replace with actual image
                radius: 24.0,
              ),
              title: const Text('Manu Kumar'),
              subtitle: const Text('HiHello, Inc. | Co-founder & CEO'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ],
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
