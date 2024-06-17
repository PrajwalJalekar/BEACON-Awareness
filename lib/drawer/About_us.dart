// lib/drawer/About_us.dart

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
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
              _buildTeamMembers(),
              SizedBox(height: 24.0),
              _buildMission(),
              SizedBox(height: 24.0),
              _buildExploreText(),
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
          'Welcome to Beacon!',
          style: TextStyle(
            fontSize: 36.0,
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
          'Empowering You with Information',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white70,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTeamMembers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Meet Our Team:',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12.0),
        _buildTeamMember('Prajwal Manohar Jalekar'),
        _buildTeamMember('Ayush Suresh Charde'),
        _buildTeamMember('Anurag Tukaram Zade'),
        _buildTeamMember('Ravina Ramkrishna Fale'),
        _buildTeamMember('Sejal Vinod Rajurkar'),
        _buildTeamMember('Tanashree Avinash Done'),
      ],
    );
  }

  Widget _buildTeamMember(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildMission() {
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
            Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              'To provide you with real-time information tailored to your needs and interests, empowering you with knowledge and awareness.',
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

  Widget _buildExploreText() {
    return Text(
      'Explore the world with Beacon!',
      style: TextStyle(
        fontSize: 24.0,
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
    );
  }
}
