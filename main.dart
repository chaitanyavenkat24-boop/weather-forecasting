import 'package:flutter/material.dart'; // Import the material package to use Gradient, LinearGradient, Color, etc.

// --- Helper functions ---
Gradient _backgroundGradient(String condition) {
  switch (condition.toLowerCase()) {
    case "sunny":
      return const LinearGradient(
        colors: [Color(0xFFf6d365), Color(0xFFfda085)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case "cloudy":
      return const LinearGradient(
        colors: [Color(0xFFbdc3c7), Color(0xFF2c3e50)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case "rainy":
      return const LinearGradient(
        colors: [Color(0xFF4e54c8), Color(0xFF8f94fb)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case "storm":
      return const LinearGradient(
        colors: [Color(0xFF232526), Color(0xFF414345)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case "snow":
      return const LinearGradient(
        colors: [Color(0xFFe0eafc), Color(0xFFcfdef3)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    default:
      return const LinearGradient(
        colors: [Color(0xFF89f7fe), Color(0xFF66a6ff)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
  }
}

Widget glassCard({required Widget child}) {
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      // Fixed: Replaced Colors.white.withOpacity(0.15) with an explicit Color value.
      color: const Color(0x26FFFFFF), // Alpha 0x26 (38) for 15% opacity
      borderRadius: BorderRadius.circular(18),
      // Fixed: Replaced Colors.white.withOpacity(0.25) with an explicit Color value.
      border: Border.all(color: const Color(0x40FFFFFF)), // Alpha 0x40 (64) for 25% opacity
      boxShadow: [
        BoxShadow(
          // Fixed: Replaced Colors.black.withOpacity(0.15) with an explicit Color value.
          color: const Color(0x26000000), // Alpha 0x26 (38) for 15% opacity
          blurRadius: 20,
          spreadRadius: 1,
        )
      ],
    ),
    child: child,
  );
}

// Placeholder variables and methods for the build method to make the code runnable.
// In a real application, these would be defined in a StatefulWidget's State class.
// For the purpose of fixing the 'Gradient' error, these are mock implementations.
final TextEditingController _controller = TextEditingController();
String condition = "sunny"; // Example condition
String city = "London"; // Example city
double temperature = 20.0; // Example temperature
int humidity = 70; // Example humidity
double windSpeed = 15.0; // Example wind speed
int pressure = 1012; // Example pressure
List<Map<String, dynamic>> forecast = [
  {"day": "Mon", "icon": Icons.wb_sunny, "temp": 22},
  {"day": "Tue", "icon": Icons.cloud, "temp": 18},
  {"day": "Wed", "icon": Icons.water_drop, "temp": 15},
];

void updateWeather(String city) {
  // Mock implementation for updating weather
  print("Updating weather for $city");
  // In a real application, this would typically involve fetching data
  // and then calling setState() if this were part of a StatefulWidget
  // to rebuild the UI with new data.
}

// --- WeatherApp Widget ---
// The original build method was not enclosed in a widget class.
// It has been wrapped in a StatelessWidget to make it a valid Flutter UI component.
class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        gradient: _backgroundGradient(condition),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search city",
                  hintStyle: const TextStyle(color: Colors.white70),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        updateWeather(_controller.text);
                      }
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.white54),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(city,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: Text(
                  "$temperature°C",
                  key: ValueKey(temperature),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 74,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(condition,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              const SizedBox(height: 28),
              glassCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      const Icon(Icons.water_drop, color: Colors.white),
                      Text("$humidity%",
                          style: const TextStyle(color: Colors.white))
                    ]),
                    Column(children: [
                      const Icon(Icons.air, color: Colors.white),
                      Text("$windSpeed km/h",
                          style: const TextStyle(color: Colors.white))
                    ]),
                    Column(children: [
                      const Icon(Icons.speed, color: Colors.white),
                      Text("$pressure hPa",
                          style: const TextStyle(color: Colors.white))
                    ]),
                  ],
                ),
              ),
              const Spacer(),
              glassCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: forecast.map((day) {
                    return Column(
                      children: [
                        Icon(day["icon"], color: Colors.white, size: 28),
                        const SizedBox(height: 3),
                        Text(day["day"],
                            style:
                                const TextStyle(color: Colors.white, fontSize: 13)),
                        Text("+${day["temp"]}°C",
                            style:
                                const TextStyle(color: Colors.white, fontSize: 13)),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Main entry point for the Flutter application ---
// The original code was missing a main function, which is required for a Dart application.
void main() {
  runApp(const MaterialApp(
    home: WeatherApp(),
  ));
}