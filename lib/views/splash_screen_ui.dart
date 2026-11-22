import 'package:flutter/material.dart';
import 'package:flutter_taxi_fare_app/views/taxi_fare_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      //หน่วงเวลา 3 วินาที
      Duration(seconds: 3),
      //เมื่อครบแล้วให้ทำอะไร
      //contextแทนหน้าจอตัวเอง
      //materialAppแทนหน้าจอที่เราต้องการจะไป
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TaxiFareUi()),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 243, 253, 100),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/taxi.png',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 50),
            Text(
              'Taxi Fare Calculator',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: const Color.fromARGB(255, 147, 199, 227),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'คำนวนค่าโดยสารแท็กซี่',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: const Color.fromARGB(255, 147, 199, 227),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Colors.amber),
          ],
        ),
      ),
    );
  }
}
