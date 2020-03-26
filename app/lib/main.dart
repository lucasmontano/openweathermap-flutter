import 'package:app/pages/map.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home:HomeScreen());
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to ',
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 320,
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text(
                  'Weather App',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            OutlineButton(
                child: Text(
                  "Entrar no App",
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapSample(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(30.0)))
          ],
        ),
      ),
    );
  }
}
