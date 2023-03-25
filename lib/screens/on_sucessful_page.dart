import "package:flutter/material.dart";
import 'package:packs_your_bag/main.dart';

class CheckStatus extends StatelessWidget {
  const CheckStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.deepOrange,
              height: 50,
              width: double.infinity,
              child: Center(
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Text(
                      "Pack Your Bags",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/images/success.png'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                // alignment: Alignment.center,
                padding: EdgeInsets.all(
                  18,
                ),
                child: Text(
                  "Hurray! \nYour Booking has been placed!.",
                  style: TextStyle(
                    fontSize: 34,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
