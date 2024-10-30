import 'package:flutter/material.dart';
import 'panel_detail_screen.dart';

class PanelListScreen extends StatelessWidget {
  final String panelName;

  PanelListScreen({required this.panelName});

  final List<Map<String, dynamic>> panels = [
    {
      'panel': 'Panel 1',
      'device': 'Arduino',
      'status': 'Online',
      'current': 2.9,
      'voltage': 16,
      'power': 200,
      'time': '9:41',
      'temperature': 36,
      'angle': 45,
      'image': 'assets/solar_panel.png',
    },
    {
      'panel': 'Panel 2',
      'device': 'Arduino',
      'status': 'Online',
      'current': 3.1,
      'voltage': 14,
      'power': 190,
      'time': '9:42',
      'temperature': 35,
      'angle': 40,
      'image': 'assets/solar_panel.png',
    },
    // Tambahkan data panel lainnya jika diperlukan
  ];

  @override
  Widget build(BuildContext context) {
    final panel = panels.firstWhere((p) => p['panel'] == panelName);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Image.asset('assets/logo.png', height: 30),
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
        child: ListView(
          children: [
            PanelCard(
              panelName: panel['panel'],
              device: panel['device'],
              status: panel['status'],
              current: panel['current'],
              voltage: panel['voltage'],
              power: panel['power'],
              time: panel['time'],
              temperature: panel['temperature'],
              angle: panel['angle'],
              image: panel['image'],
            ),
          ],
        ),
      ),
    );
  }
}

class PanelCard extends StatelessWidget {
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

  const PanelCard({
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
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  height: 80,
                  width: 80,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        panelName,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(device, style: TextStyle(color: Colors.grey)),
                          Spacer(),
                          Text(
                            status,
                            style: TextStyle(
                              color: status == 'Online' ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoChip(label: 'Current', value: '${current.toStringAsFixed(1)} A'),
                          InfoChip(label: 'Voltage', value: '${voltage} V'),
                          InfoChip(label: 'Power', value: '${power} W'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            time,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                '${temperature}°C',
                                style: TextStyle(fontSize: 14, color: Colors.blue),
                              ),
                              Text(
                                '${angle}°',
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PanelDetailScreen(
                        panelName: panelName,
                        device: device,
                        status: status,
                        current: current,
                        voltage: voltage,
                        power: power,
                        time: time,
                        temperature: temperature,
                        angle: angle,
                        image: image,
                      ),
                    ),
                  );
                },
                child: Text('View Details'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // gunakan backgroundColor
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoChip extends StatelessWidget {
  final String label;
  final String value;

  const InfoChip({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
