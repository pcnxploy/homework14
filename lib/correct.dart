import 'package:flutter/material.dart';

class GuessTrue extends StatelessWidget {
  const GuessTrue({Key? key}) : super(key: key);
  static const routeName = '/correct';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("GUESS TEACHER'S AGE", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: Colors.yellow.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'อายุุอาจารย์',
                style: TextStyle(fontSize: 30.0, color: Colors.green),
              ),
              SizedBox(height: 10.0),
              Text('25 ปี 6 เดือน', style: TextStyle(fontSize: 20.0)),
              SizedBox(height: 10.0),
              Icon(
                Icons.check,
                size: 50.0,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
