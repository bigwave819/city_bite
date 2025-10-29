import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar replaces static CustomAppBar
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            floating: true,
            snap: true,
            centerTitle: true,
            title: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: null, // Add your logic here
              ),
            ],
          ),

          // Page Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 60),

                  // Avatar Image
                  const CircleAvatar(
                    radius: 60,
                    foregroundImage: AssetImage('images/avatar.png'),
                  ),

                  const SizedBox(height: 30),

                  // Profile Info Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const ProfileInfoRow(
                          icon: Icons.person,
                          preTitle: 'Full Name',
                          title: 'Hirwa Tresor',
                        ),
                        const SizedBox(height: 12),
                        const ProfileInfoRow(
                          icon: Icons.email,
                          preTitle: 'Email Info',
                          title: 'hirwa@example.com',
                        ),
                        const SizedBox(height: 12),
                        const ProfileInfoRow(
                          icon: Icons.phone,
                          preTitle: 'Phone number',
                          title: '+250 123 456 789',
                        ),
                        const SizedBox(height: 12),
                        const ProfileInfoRow(
                          icon: Icons.location_city,
                          preTitle: 'Address Info',
                          title: 'Kigali, Rwanda',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Edit Profile button
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orange.withValues(alpha: 0.1),
                      border: Border.all(color: Colors.orange),
                    ),
                    child: const Center(
                      child: Text(
                        'Edit Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Logout button
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red.withValues(alpha: 0.1),
                      border: Border.all(color: Colors.red),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.logout, size: 16, color: Colors.red),
                          SizedBox(width: 6),
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A reusable row for profile info with circular icon
class ProfileInfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String preTitle;

  const ProfileInfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.preTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Circular icon with light orange background
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange.withValues(alpha: 0.2),
          ),
          child: Icon(icon, color: Colors.orange, size: 28),
        ),
        const SizedBox(width: 16),
        // Text info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              preTitle,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
