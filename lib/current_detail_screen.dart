import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CurrentDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Detail"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: true),
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 10,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 2),
                        FlSpot(1, 5),
                        FlSpot(2, 3),
                        FlSpot(3, 7),
                        FlSpot(4, 1),
                        FlSpot(5, 6),
                        FlSpot(6, 4),
                      ],
                      isCurved: true,
                      color: Colors.blue, // Use 'color' instead of 'colors'
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Current Data",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Current (A)')),
                  ],
                  rows: [
                    DataRow(cells: [DataCell(Text('01/01/2024')), DataCell(Text('5.2'))]),
                    DataRow(cells: [DataCell(Text('02/01/2024')), DataCell(Text('6.1'))]),
                    DataRow(cells: [DataCell(Text('03/01/2024')), DataCell(Text('4.8'))]),
                    DataRow(cells: [DataCell(Text('04/01/2024')), DataCell(Text('5.5'))]),
                    DataRow(cells: [DataCell(Text('05/01/2024')), DataCell(Text('7.2'))]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
