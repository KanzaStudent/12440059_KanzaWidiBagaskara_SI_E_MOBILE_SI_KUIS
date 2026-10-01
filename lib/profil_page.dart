import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 10, 164, 162),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
            SizedBox(height: 12),
            Text('LEON', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('owner', style: TextStyle(color: Colors.grey)),
          ],
        ),
        
      ),
    );
  }
}