// lib/drawer/Contact_us.dart

// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeader(),
              SizedBox(height: 32.0),
              _buildContactCard(
                label: 'Email',
                value: 'info_beaconapp@gmail.com',
                icon: Icons.email,
              ),
              SizedBox(height: 16.0),
              _buildContactCard(
                label: 'Phone',
                value: '+1 (123) 456-7890',
                icon: Icons.phone,
              ),
              SizedBox(height: 16.0),
              _buildContactCard(
                label: 'Address',
                value: 'Wardha, Maharashtra',
                icon: Icons.location_on,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      'Get in Touch!',
      style: TextStyle(
        fontSize: 32.0,
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

  Widget _buildContactCard(
      {required String label, required String value, required IconData icon}) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Icon(
          icon,
          size: 36.0,
          color: Colors.blue,
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
