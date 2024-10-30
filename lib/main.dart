import 'package:flutter/material.dart';
import 'device_list_screen.dart'; // Import halaman kedua

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Selection',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DeviceSelectionScreen(),
    );
  }
}

class DeviceSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Image.asset('assets/logo.png', height: 30),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.widgets_outlined,
              size: 80,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Text(
              'Select the device and connection type\nyou will use',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 30),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Hardware'),
              items: ['Arduino', 'Raspberry Pi', 'ESP32']
                  .map((device) => DropdownMenuItem<String>(
                        value: device,
                        child: Text(device),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Connection Type'),
              items: ['Wi-Fi', 'Bluetooth', 'USB']
                  .map((connection) => DropdownMenuItem<String>(
                        value: connection,
                        child: Text(connection),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman kedua
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeviceListScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Next',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
