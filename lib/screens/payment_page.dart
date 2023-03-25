import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:packs_your_bag/screens/home_page.dart';
import 'package:packs_your_bag/utils/utils.dart';

class PaymentPage extends StatefulWidget {
  final String source;
  final String dest;
  final String name;
  final String date;
  final String tourist;
  final String mobile;
  const PaymentPage(
      {super.key,
      required this.source,
      required this.dest,
      required this.date,
      required this.mobile,
      required this.name,
      required this.tourist});

  @override
  State<PaymentPage> createState() => _PaymentPageState(
      source: source,
      dest: dest,
      date: date,
      name: name,
      mobile: mobile,
      tourist: tourist);
}

class _PaymentPageState extends State<PaymentPage> {
  final String source;
  final String dest;
  final String name;
  final String date;
  final String tourist;
  final String mobile;
  _PaymentPageState(
      {required this.source,
      required this.dest,
      required this.date,
      required this.mobile,
      required this.name,
      required this.tourist});

  final databaseRef = FirebaseDatabase.instance.ref('history');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(8),
          color: Colors.deepOrange,
          height: 50,
          width: double.infinity,
          child: Center(
            child: Row(
              children: const [
                // Icon(
                //   Icons.arrow_back,
                //   size: 30,
                // ),
                SizedBox(
                  width: 14,
                ),
                Text(
                  "Pack Your Bags",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Payment",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // SizedBox(
        //   height: 0,
        // ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(10),
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: AssetImage('asset/images/qrcode.jpg'), fit: BoxFit.fill),
          ),
        ),
        InkWell(
          onTap: () {
            databaseRef
                .child(DateTime.now().millisecondsSinceEpoch.toString())
                .set({
              'source': source,
              'dest': dest,
              'tourist': tourist,
              'name': name,
              'date': date,
              'mobile': mobile,
            }).then((value) {
              Utils().toastMessage("Booked Successfully");
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }).onError((error, stackTrace) {
              Utils().toastMessage(error.toString());
            });
          },
          child: Container(
            margin: EdgeInsets.all(12),
            width: 300,
            height: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.deepOrange),
            child: Center(
                child: Text(
              "Paid",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
      ]),
    ));
  }
}
