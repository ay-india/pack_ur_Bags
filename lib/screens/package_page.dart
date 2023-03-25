import 'package:flutter/material.dart';
import 'package:packs_your_bag/screens/cart_page.dart';

class PackagePage extends StatelessWidget {
  final String source;
  final String dest;
  final String cab;
  final String flight;
  final String hotel;
  final String price;
  final String img;
  final String day;
  const PackagePage(
      {super.key,
      required this.source,
      required this.dest,
      required this.cab,
      required this.flight,
      required this.hotel,
      required this.price,
      required this.img,
      required this.day});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //appbar
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

            // Explore------
            Padding(
              padding: EdgeInsets.all(6),
              child: Text(
                "Explore!!!",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),

            //
            Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(6),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(
                  30,
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    img,
                  ),
                ),
              ),
            ),

            // details part

            Container(
              margin: EdgeInsets.all(
                12,
              ),
              padding: EdgeInsets.all(6),
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 229, 228),
                borderRadius: BorderRadius.circular(
                  14,
                ),
                // color: Colors.red,
              ),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  '$source - $dest',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  // height: 2,
                  thickness: 3,
                  indent: 6,
                  endIndent: 6,
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Tour Day: $day days',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Flights: $flight',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hotels: $hotel',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Cabs: Uber, Ola',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepOrange),
                    child: Text(
                      'Price: ₹$price',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ]),
            ),

            SizedBox(
              height: 0,
            ),
            // Contianer

            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(source: source,dest: dest,img: img,price: price,),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.deepOrange,
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(7),
                    height: 50,
                    width: 150,
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
