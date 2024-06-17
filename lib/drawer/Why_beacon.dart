// lib/drawer/Why_beacon.dart

// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class WhyBeaconScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Why Beacon',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 13, 111, 191),
        elevation: 4,
        iconTheme: IconThemeData(
          color: Colors.white, // Change the back button color to white
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade700,
              Colors.lightBlue.shade300,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildHeader(),
              SizedBox(height: 24.0),
              _buildFeatureCard(
                Icons.access_time,
                'Real-time Updates',
                'Get the latest information and updates in real-time, ensuring you are always in the know.',
              ),
              SizedBox(height: 16.0),
              _buildFeatureCard(
                Icons.person,
                'Personalized Content',
                'Tailored content delivery based on your preferences, providing a personalized and efficient experience.',
              ),
              SizedBox(height: 16.0),
              _buildFeatureCard(
                Icons.mobile_friendly,
                'User-Friendly Interface',
                'Intuitive and easy-to-use design for seamless navigation and accessibility.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Unlocking the Power of Information',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 5.0,
                color: Colors.black54,
                offset: Offset(0, 3),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.0),
        Text(
          'Beacon is your gateway to staying informed and empowered. Here\'s why:',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white70,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String description) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Colors.blue,
            ),
            SizedBox(height: 12.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
