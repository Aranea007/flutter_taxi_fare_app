import 'package:flutter/material.dart';

class TaxiFareUi extends StatefulWidget {
  const TaxiFareUi({super.key});

  @override
  State<TaxiFareUi> createState() => _TaxiFareUiState();
}

class _TaxiFareUiState extends State<TaxiFareUi> {
  TextEditingController distanceCount = TextEditingController();
  TextEditingController timeCount = TextEditingController();

  //ค่าคำนวน
  String showprice = '0.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 243, 253, 100),
      appBar: AppBar(
        title: Text(
          'Taxi Fare',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Image.asset(
                'assets/images/taxi.png',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                'คำนวนค่าโดยสารแท็กซี่',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Align(
                alignment: AlignmentGeometry.centerStart,
                child: Text(
                  'ระยะทาง (กิโลเมตร)🛣️',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(height: 10),
              //ช่องระยะทาง
              TextField(
                controller: distanceCount,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'กรุณากรอกระยะทาง',
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  'เวลารถติด (นาที)⏰',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(height: 10),
              //ช่องเวลารถติด
              TextField(
                controller: timeCount,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'กรุณากรอกเวลารถติด',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //valid ค่าก่อนคำนวน
                  //ตรวจว่าข้อความว่างไหม
                  if (distanceCount.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('กรุณากรอกข้อมูลให้ครบถ้วน1'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }
                  if (timeCount.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('ผมไม่เชื่อว่าคุณไม่เจอรถติด!!!'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }
                  //คำนวนค่าโดยสาร
                  double distance = double.parse(distanceCount.text);
                  double time = double.parse(timeCount.text);
                  double price = 0;

                  //ใส่ลำดับให้ถูก คำนวน priceก่อนแล้วค่อยไปรวมกับfare
                  if (distance <= 1) {
                    price = 35;
                  } else if (distance <= 10) {
                    price = 35 + (6.50 * distance);
                  } else if (distance <= 20) {
                    price = 35 + (7.00 * distance);
                  } else if (distance <= 40) {
                    price = 35 + (8.00 * distance);
                  } else if (distance <= 60) {
                    price = 35 + (8.50 * distance);
                  } else if (distance <= 80) {
                    price = 35 + (9.00 * distance);
                  } else {
                    price = 35 + (10.50 * distance);
                  }
                  //คํานวนค่าโดยสาร
                  double fare = price + (time * 3);
                  //แสดงผล
                  setState(() {
                    showprice = fare.toStringAsFixed(2);
                  });
                },
                child: Text(
                  'คํานวนค่าโดยสาร',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height * 0.07,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    distanceCount.text = '';
                    timeCount.text = '';
                    showprice = '0.00';
                  });
                },
                child: Text(
                  'ยกเลิก',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height * 0.07,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              //แสดงผล
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 254, 245, 126),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ค่าโดยสารแท็กซี่',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      showprice,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.1,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Text(
                      'บาท',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
