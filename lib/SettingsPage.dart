import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 125, 60, 253),
                        Color.fromARGB(255, 88, 70, 221)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SoftCard Professional',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Supercharge your brand.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Upgrade',
                          style: TextStyle(
                            color: Color.fromARGB(255, 125, 60, 253),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Account Section
            buildSectionHeader('ACCOUNT'),
            buildListTile(
              icon: Icons.person,
              title: 'Manage account',
            ),
            buildListTile(
              icon: Icons.credit_card,
              title: 'Manage subscription',
            ),
            buildListTile(
              icon: Icons.card_membership,
              title: 'Default Card',
            ),
            const SizedBox(height: 16),
            // Appearance Section
            buildSectionHeader('APPEARANCE'),
            buildListTile(
              icon: Icons.brightness_6,
              title: 'App theme',
              trailing: const Text('Device settings'),
            ),
            buildSwitchTile(
              icon: Icons.brightness_auto,
              title: 'Automatic brightness',
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            // Preferences Section
            buildSectionHeader('PREFERENCES'),
            buildListTile(
              icon: Icons.lock,
              title: 'Permissions',
            ),

            // Notification Section
            buildListTile(
              icon: Icons.notifications,
              title: 'Notifications',
            ),
            // Notification Section
            buildSwitchTile(
              icon: Icons.vibration,
              title: 'Haptic Feedback',
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            // GENERAL Section
            buildSectionHeader('GENERAL'),
            buildListTile(
              icon: Icons.lock,
              title: 'Integrations',
            ),
            buildListTile(
              icon: Icons.message,
              title: 'Contact Supports',
            ),
            buildListTile(
              icon: Icons.help,
              title: 'Helps Center',
            ),
            buildListTile(
              icon: Icons.feedback,
              title: 'Send Feedback',
            ),
            buildListTile(
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
            ),
            buildListTile(
              icon: Icons.verified_user_outlined,
              title: 'Version',
            ),
            buildListTile(
              icon: Icons.timelapse,
              title: 'Check For Update',
            ),
            const SizedBox(height: 16),
            // CONTACTS Section
            buildSectionHeader('CONTACTS'),
            buildListTile(
              icon: Icons.emoji_emotions,
              title: 'Emojis for SoftCard Contacts',
            ),
            buildListTile(
              icon: Icons.import_export,
              title: 'Export to other address books',
            ),
            buildListTile(
              icon: Icons.bookmark,
              title: 'Manage address books',
            ),
            buildListTile(
              icon: Icons.download,
              title: 'Export contacts',
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                width: 300,
                height: 100,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Loving HiHello?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white),
                      child: const Text('Leave a review'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(child: Text("Follow us to stay up to date")),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.twitter,
                        color: Colors.black), // FontAwesome Twitter Icon
                    onPressed: () {}, // Define your action here
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.instagram,
                        color: Colors.black), // FontAwesome Twitter Icon
                    onPressed: () {}, // Define your action here
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedinIn,
                        color: Colors.black),
                    onPressed: () {}, // Define your action here
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildListTile({
    required IconData icon,
    required String title,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  Widget buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: const Color.fromARGB(255, 125, 60, 253),
    );
  }
}
