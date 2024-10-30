import 'package:flutter/material.dart';
import 'panel_list_screen.dart'; // Import halaman ketiga

class DeviceListScreen extends StatelessWidget {
  final List<Map<String, String>> devices = [
    {'panel': 'Panel 1', 'id': 'AXBP-3231', 'status': 'Online'},
    {'panel': 'Panel 2', 'id': 'AXCD-3231', 'status': 'Offline'},
    {'panel': 'Panel 3', 'id': 'ASMB-1504', 'status': 'Offline'},
    {'panel': 'Panel 4', 'id': 'ASCD-3231', 'status': 'Offline'},
  ];

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
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  final device = devices[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PanelListScreen(panelName: device['panel']!),
                        ),
                      );
                    },
                    child: DeviceCard(
                      panel: device['panel']!,
                      id: device['id']!,
                      status: device['status']!,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Add New Devices',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final String panel;
  final String id;
  final String status;

  const DeviceCard({
    Key? key,
    required this.panel,
    required this.id,
    required this.status,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              panel,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Icon(
              Icons.widgets_outlined,
              size: 40,
              color: Colors.black,
            ),
            SizedBox(height: 10),
            Text(
              id,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              status,
              style: TextStyle(
                fontSize: 14,
                color: status == 'Online' ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
