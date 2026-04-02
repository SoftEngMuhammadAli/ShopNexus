import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_nexus/shared/widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'User Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'user@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const Text(
              'Account Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit profile not implemented')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Addresses'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Addresses not implemented')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Payment Methods'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Payment methods not implemented'),
                  ),
                );
              },
            ),
            const Spacer(),
            CustomButton(text: 'Logout', onPressed: () => context.go('/login')),
          ],
        ),
      ),
    );
  }
}
