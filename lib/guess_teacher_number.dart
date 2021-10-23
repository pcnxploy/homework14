import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:untitled/api.dart';
import 'package:untitled/api_result.dart';
import 'package:untitled/correct.dart';

class GuessTeacherAge extends StatefulWidget {
  const GuessTeacherAge({Key? key}) : super(key: key);

  @override
  _GuessTeacherAgeState createState() => _GuessTeacherAgeState();
}

class _GuessTeacherAgeState extends State<GuessTeacherAge> {
  int year = 0;
  int month = 0;
  var _isLoading = false;

  guessYearOrMonth(double num, int pos) {
    int n = num as int;
    setState(() {
      if (pos == 1) {
        year = n;
      } else {
        month = n;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("GUESS TEACHER'S AGE", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: Colors.yellow.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'อายุอาจารย์',
                style: TextStyle(fontSize: 26.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10.0),
                      Text('ปี'),
                      SpinBox(
                        min: 0,
                        max: 99,
                        value: 0, //ค่าที่จะโชว์ตอนรัน
                        onChanged: (value) => guessYearOrMonth(value, 1),
                      ),
                      SizedBox(height: 10.0),
                      Text('เดือน'),
                      SpinBox(
                        min: 0,
                        max: 11,
                        value: 0,
                        onChanged: (value) => guessYearOrMonth(value, 2),
                      ),
                      SizedBox(height: 10.0),
                      Center(
                          child: ElevatedButton(
                              onPressed: () {
                                _handleClickButton();
                              },
                              child: Text('ทาย')))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  var message;

  Future<bool?> _checkAge() async {
    try {
      setState(() {
        _isLoading = true;
      });
      var response = (await Api()
              .submit('guess_teacher_age', {'year': year, 'month': month}))
          as Map<String, dynamic>;
      var result = response["value"] as bool;
      message = response["text"];
      return result;
    } catch (e) {
      print(e);
      _showMaterialDialog('ERROR', e.toString());
      return null;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  _handleClickButton() async {
    var isLogin = await _checkAge();

    if (isLogin == null) return;

    if (isLogin == true) {
      Navigator.pushReplacementNamed(context, GuessTrue.routeName);
    } else {
      _showMaterialDialog('ผลการทาย', message);
    }
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
