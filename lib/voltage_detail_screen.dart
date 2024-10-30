import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VoltageDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voltage Detail"),
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
                  maxY: 15,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 5),
                        FlSpot(1, 10),
                        FlSpot(2, 7),
                        FlSpot(3, 12),
                        FlSpot(4, 9),
                        FlSpot(5, 14),
                        FlSpot(6, 11),
                      ],
                      isCurved: true,
                      color: Colors.orange, // Use 'color' instead of 'colors'
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Voltage Data",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Voltage (V)')),
                  ],
                  rows: [
                    DataRow(cells: [DataCell(Text('01/01/2024')), DataCell(Text('12.5'))]),
                    DataRow(cells: [DataCell(Text('02/01/2024')), DataCell(Text('11.8'))]),
                    DataRow(cells: [DataCell(Text('03/01/2024')), DataCell(Text('13.1'))]),
                    DataRow(cells: [DataCell(Text('04/01/2024')), DataCell(Text('12.0'))]),
                    DataRow(cells: [DataCell(Text('05/01/2024')), DataCell(Text('13.5'))]),
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
