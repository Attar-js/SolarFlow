import 'package:flutter/material.dart';
import 'current_detail_screen.dart'; // Import the CurrentDetailScreen
import 'voltage_detail_screen.dart'; // Import the VoltageDetailScreen
import 'power_detail_screen.dart'; // Import the PowerDetailScreen

class PanelDetailScreen extends StatelessWidget {
  final String panelName;
  final String device;
  final String status;
  final double current;
  final int voltage;
  final int power;
  final String time;
  final int temperature;
  final int angle;
  final String image;

  const PanelDetailScreen({
    Key? key,
    required this.panelName,
    required this.device,
    required this.status,
    required this.current,
    required this.voltage,
    required this.power,
    required this.time,
    required this.temperature,
    required this.angle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(panelName, style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(image, height: 100),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${temperature}°C',
                            style: TextStyle(fontSize: 24, color: Colors.blue),
                          ),
                          Text('Temperature'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            time,
                            style: TextStyle(fontSize: 24),
                          ),
                          Text('Time'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${angle}°',
                            style: TextStyle(fontSize: 24, color: Colors.grey),
                          ),
                          Text('Slope'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('14/05/2023', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('Slope & Temperature', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                    // Row for Temperature and Slope headers
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Time',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Temperature',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Slope',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5, // Jumlah data dummy, ganti sesuai kebutuhan
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    time,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${temperature}°C',
                                    style: TextStyle(color: Colors.blue),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${angle}°',
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CurrentDetailScreen()),
                    );
                  },
                  child: Text('Current'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VoltageDetailScreen()),
                    );
                  },
                  child: Text('Voltage'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PowerDetailScreen()),
                    );
                  },
                  child: Text('Power'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add navigation for slope if needed
                  },
                  child: Text('Slope'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
