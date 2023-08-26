import 'package:flutter/material.dart';

class Bmi_Result extends StatelessWidget {

  final double result ;
  final bool ismale ;
  final int Age ;

  Bmi_Result({required this.result, required this.ismale, required this.Age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f1b31),
      appBar: AppBar(
        backgroundColor:Color(0xff1f1b31),
        title: Text(
          'Bmi Result ',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text(
              'Gender : ${ismale  ? 'Male' : 'Female'}',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.pinkAccent ,
                fontWeight: FontWeight.w700 ,

              ),
            ),
            Text(
              'Result :${result}',
              style: TextStyle(
                fontSize: 40.0 ,
                color: Colors.pinkAccent ,
                fontWeight: FontWeight.w700 ,
              ),
            ),
            Text(
              'Age :${Age}',
              style: TextStyle(
                fontSize: 40.0 ,
                color: Colors.pinkAccent ,
                fontWeight: FontWeight.w700 ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}