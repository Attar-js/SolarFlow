import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PowerDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Power Detail"),
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
                  maxY: 100,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 20),
                        FlSpot(1, 50),
                        FlSpot(2, 30),
                        FlSpot(3, 80),
                        FlSpot(4, 40),
                        FlSpot(5, 90),
                        FlSpot(6, 70),
                      ],
                      isCurved: true,
                      color: Colors.green, // Use 'color' instead of 'colors'
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Power Data",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Power (W)')),
                  ],
                  rows: [
                    DataRow(cells: [DataCell(Text('01/01/2024')), DataCell(Text('50'))]),
                    DataRow(cells: [DataCell(Text('02/01/2024')), DataCell(Text('60'))]),
                    DataRow(cells: [DataCell(Text('03/01/2024')), DataCell(Text('55'))]),
                    DataRow(cells: [DataCell(Text('04/01/2024')), DataCell(Text('70'))]),
                    DataRow(cells: [DataCell(Text('05/01/2024')), DataCell(Text('80'))]),
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
