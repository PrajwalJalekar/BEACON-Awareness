// HomeScreen.dart

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../widget/bottom_navbar.dart';
import '../drawer/About_us.dart';
import '../drawer/Contact_us.dart';
import '../drawer/Why_beacon.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 3),
      appBar: buildAppBar(),
      body: buildBody(context),
      bottomNavigationBar: AnimatedBottomNavBar(
        initialIndex: 0,
      ),
      endDrawer: buildEndDrawer(context), // Pass the context
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 111, 191),
        title: buildAppBarTitle(),
        elevation: 3,
        centerTitle: false,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.white,
        ));
  }

  Widget buildAppBarTitle() {
    return Row(
      children: [
        Icon(
          Icons.lightbulb,
          color: Colors.amber,
          size: 30,
        ),
        const SizedBox(width: 4),
        Text(
          'Beacon',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    return Stack(
      children: [
        buildBackgroundGradient(),
        buildBackgroundImage(),
        buildCenteredRoundedContainer(context),
      ],
    );
  }

  Container buildBackgroundGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlueAccent.withOpacity(0.7),
            const Color.fromARGB(255, 236, 230, 208),
          ],
        ),
      ),
    );
  }

  Positioned buildBackgroundImage() {
    return Positioned.fill(
      child: Image.network(
        'https://imgs.search.brave.com/2Srynoe8l2m8tggQlKsJOhkMJjwxWpWppTHIJkrH1p8/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2NlL2Rk/Lzg4L2NlZGQ4ODUz/M2ZmZmM3NzdiZTEx/NTEyNGJhNGI4MWMy/LmpwZw',
        fit: BoxFit.cover,
      ),
    );
  }

  Positioned buildCenteredRoundedContainer(BuildContext context) {
    return Positioned(
      top: 100,
      left: MediaQuery.of(context).size.width / 4,
      child: Container(
        height: 250,
        width: MediaQuery.of(context).size.width / 2,
        decoration: buildContainerDecoration(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: buildContainerWithGradientAndText(),
        ),
      ),
    );
  }

  BoxDecoration buildContainerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 4,
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  Container buildContainerWithGradientAndText() {
    return Container(
      decoration: buildGradientDecoration(),
      child: buildCenteredText(),
    );
  }

  BoxDecoration buildGradientDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.lightBlue.withOpacity(0.5),
          Colors.lightBlueAccent.withOpacity(0.5),
        ],
      ),
    );
  }

  Center buildCenteredText() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildHeaderText(),
          const SizedBox(height: 8),
          buildDescriptionText(),
        ],
      ),
    );
  }

  Text buildHeaderText() {
    return const Text(
      'BEACON',
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text buildDescriptionText() {
    return const Text(
      'An application that keeps\npeople aware of the latest updates',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Nunito',
      ),
      textAlign: TextAlign.center,
    );
  }

  Drawer buildEndDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 13, 111, 191),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lightbulb,
                  color: Colors.amber, // Set menu icon color to white
                  size: 64,
                ),
                const SizedBox(height: 8),
                Text(
                  'BEACON',
                  style: TextStyle(
                    color: Color.fromARGB(255, 253, 255, 234),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.help,
                color: Color.fromARGB(
                    255, 41, 41, 41)), // Set menu icon color to white
            title: Text(
              'Why Beacon',
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WhyBeaconScreen()), // Navigate to WhyBeaconScreen
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info,
                color: const Color.fromARGB(
                    255, 41, 41, 41)), // Set menu icon color to white
            title: Text(
              'About Us',
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AboutUsScreen()), // Navigate to AboutUsScreen
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.mail,
                color: const Color.fromARGB(
                    255, 41, 41, 41)), // Set menu icon color to white
            title: Text(
              'Contact Us',
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ContactUsScreen()), // Navigate to ContactUsScreen
              );
            },
          ),
        ],
      ),
    );
  }
}
