import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Página en Mantenimiento',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MaintenancePage(),
    );
  }
}

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "🚧",
                style: TextStyle(
                  fontSize: 200,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Página en mantenimiento',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Gracias por tu paciencia. Estamos realizando mejoras\npara ofrecerte una mejor experiencia\nVolveremos muy pronto..',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
