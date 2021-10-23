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
        child: Column(
          children: [
            Text('อายุุอาจารย์'),
            Text('25 ปี 6 เดือน'),
            Icon(
              Icons.check,
            ),
          ],
        ),
      ),
    );
  }
}
