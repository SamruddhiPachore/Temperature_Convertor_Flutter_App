import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double _fahrenheit = 0;
  double _celsius = 0;

  void _convertToFahrenheit(double celsius) {
    setState(() {
      _fahrenheit = (celsius * 9 / 5) + 32;
    });
  }

  void _convertToCelsius(double fahrenheit) {
    setState(() {
      _celsius = (fahrenheit - 32) * 5 / 9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                double input = double.tryParse(value) ?? 0;
                _convertToFahrenheit(input);
              },
              decoration: InputDecoration(labelText: 'Enter Celsius'),
            ),
            SizedBox(height: 20),
            Text('Fahrenheit: $_fahrenheit'),
            SizedBox(height: 40),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                double input = double.tryParse(value) ?? 0;
                _convertToCelsius(input);
              },
              decoration: InputDecoration(labelText: 'Enter Fahrenheit'),
            ),
            SizedBox(height: 20),
            Text('Celsius: $_celsius'),
          ],
        ),
      ),
    );
  }
}
