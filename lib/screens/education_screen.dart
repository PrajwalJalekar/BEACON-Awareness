// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_declarations, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import '../widget/bottom_navbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EducationScreen extends StatefulWidget {
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  List<Map<String, dynamic>> educationNewsList = [];
  String currentLanguage = 'en'; // Default language is English

  @override
  void initState() {
    super.initState();
    fetchEdu(currentLanguage);
  }

  // API related code here
  Future<void> fetchEdu(String language) async {
    final apiKey = 'pub_409835c72579969a0231677fa482a10512d50';
    final query = 'india education';
    final url = Uri.parse(
        'https://newsdata.io/api/1/news?apikey=$apiKey&q=$query&language=$language');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic>? data = json.decode(response.body);

        if (data != null &&
            data.containsKey('results') &&
            data['results'] != null) {
          setState(() {
            educationNewsList =
                List<Map<String, dynamic>>.from(data['results']);
          });
        } else {
          print('API response does not contain valid results.');
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 165, 0),
      appBar: AppBar(
        title: Text(
          'Education Screen',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 165, 0),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 230,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://imgs.search.brave.com/xWZG37hLKNiqvkis-RQ48IisgIoEUN2DPN1rqPjAgyg/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9zdC5k/ZXBvc2l0cGhvdG9z/LmNvbS8xMDAwNjUx/LzQyNzUvaS80NTAv/ZGVwb3NpdHBob3Rv/c180Mjc1OTUxNy1z/dG9jay1waG90by1l/ZHVjYXRpb24td29y/ZC1jbG91ZC5qcGc'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(13),
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentLanguage = 'mr'; // Marathi language code
                            fetchEdu(currentLanguage);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange, // Background color
                          onPrimary: Colors.white, // Text color
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Button border radius
                          ),
                        ),
                        child: Text(
                          'मराठी',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentLanguage = 'hi'; // Hindi language code
                            fetchEdu(currentLanguage);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange, // Background color
                          onPrimary: Colors.white, // Text color
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Button border radius
                          ),
                        ),
                        child: Text(
                          'हिंदी',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentLanguage = 'en'; // English language code
                            fetchEdu(currentLanguage);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange, // Background color
                          onPrimary: Colors.white, // Text color
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Button border radius
                          ),
                        ),
                        child: Text(
                          'English',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: educationNewsList.length,
                      itemBuilder: (context, index) {
                        final item = educationNewsList[index];

                        // Check if 'title' and 'body' are not null before using them
                        final title = item['title'] ?? 'No Title';
                        final body = item['body'] ?? 'No Body';

                        return Card(
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              // Handle tap on the card, e.g., navigate to the full news article
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        body,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(height: 0),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 16, 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item.containsKey('publishDate')
                                            ? "Published: ${item['publishDate']}"
                                            : "Recently",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.share),
                                        onPressed: () {
                                          // Handle sharing functionality
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavBar(initialIndex: 1),
    );
  }
}
