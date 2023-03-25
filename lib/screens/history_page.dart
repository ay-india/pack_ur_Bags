import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final ref = FirebaseDatabase.instance.ref('history');
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
          const Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "History Page",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 247, 220, 203),
                          borderRadius: BorderRadius.circular(15)),
                      height: 120,
                      width: double.infinity,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.child('source').value.toString()} - ${snapshot.child('dest').value.toString()}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Journey Date: ${snapshot.child('date').value.toString()}",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87),
                            ),
                            Text(
                              "Tourist: ${snapshot.child('tourist').value.toString()}",
                              style: TextStyle(fontSize: 18),
                            )
                          ]),
                    );
                  }))
        ]),
      ),
    );
  }
}
