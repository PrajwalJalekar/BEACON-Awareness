import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';
import '../services/api_services.dart';
//import '../widget/bottom_navbar.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final APIServices _apiServices = APIServices();

  Future<Map<String, dynamic>> _fetchWeatherData() async {
    try {
      return await _apiServices.fetchData('weather', 'Maharashtra');
    } catch (error) {
      // Handle error, for now, just print the error
      print('Error fetching weather data: $error');
      return {};
    }
  }

  IconData _getWeatherIconData(String weatherCondition) {
    switch (weatherCondition) {
      case 'Clear':
        return WeatherIcons.day_sunny;
      case 'Clouds':
        return WeatherIcons.cloudy;
      case 'Rain':
        return WeatherIcons.rain;
      case 'Snow':
        return WeatherIcons.snow;
      case 'Thunderstorm':
        return WeatherIcons.thunderstorm;
      default:
        return WeatherIcons.na;
    }
  }

  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  bool isRaining(String weatherCondition) {
    return weatherCondition.toLowerCase().contains('rain');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather Details',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 13, 111, 191),
        iconTheme: IconThemeData(
          color: Colors.white, // Change the back button color to white
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://imgs.search.brave.com/jjEvMbnTlUAPDbgyKVdEUEs2db_XVebVbIY4b2i3hrc/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE1/OTI2MDEyNTA5ODQt/ZGEwZGM0NWUyNWY3/P3E9ODAmdz0xMDAw/JmF1dG89Zm9ybWF0/JmZpdD1jcm9wJml4/bGliPXJiLTQuMC4z/Jml4aWQ9TTN3eE1q/QTNmREI4TUh4elpX/RnlZMmg4TVRGOGZI/ZGxZWFJvWlhJbE1q/QmhjSEI4Wlc1OE1I/eDhNSHg4ZkRBPQ.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Weather Details',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: FutureBuilder<Map<String, dynamic>>(
                      future: _fetchWeatherData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Error: ${snapshot.error}',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(
                            child: Text(
                              'Error fetching weather data.\nPlease check again later.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        } else {
                          final weatherData = snapshot.data!;
                          final temperatureKelvin = weatherData['main']['temp'];
                          final description =
                              weatherData['weather'][0]['description'];
                          final humidity = weatherData['main']['humidity'];
                          final windSpeed = weatherData['wind']['speed'];
                          final visibility = weatherData['visibility'];
                          final weatherCondition =
                              weatherData['weather'][0]['main'];

                          final temperatureCelsius =
                              kelvinToCelsius(temperatureKelvin);

                          return GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: [
                              _buildInfoCard(
                                title: 'Temperature',
                                value:
                                    '${temperatureCelsius.toStringAsFixed(2)} °C',
                              ),
                              _buildInfoCard(
                                title: 'Condition',
                                value: description,
                                icon: _getWeatherIconData(weatherCondition),
                              ),
                              _buildInfoCard(
                                title: 'Humidity',
                                value: '$humidity%',
                              ),
                              _buildInfoCard(
                                title: 'Wind Speed',
                                value: '$windSpeed m/s',
                              ),
                              _buildInfoCard(
                                title: 'Visibility',
                                value: '$visibility meters',
                              ),
                              _buildInfoCard(
                                title: 'Raining',
                                value:
                                    isRaining(weatherCondition) ? 'Yes' : 'No',
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  // AnimatedBottomNavBar(initialIndex: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    IconData? icon,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white.withOpacity(0.5), // Reduce opacity
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 40,
                color: Colors.blue,
              ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
