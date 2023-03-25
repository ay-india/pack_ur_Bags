import "package:flutter/material.dart";
import 'package:packs_your_bag/main.dart';
import 'package:packs_your_bag/screens/user_details.dart';
import 'package:packs_your_bag/utils/utils.dart';

class CartPage extends StatefulWidget {
  final String source;
  final String dest;
  final String img;
  final String price;
  const CartPage(
      {super.key,
      required this.source,
      required this.dest,
      required this.img,
      required this.price});

  @override
  State<CartPage> createState() =>
      _CartPageState(source: source, dest: dest, img: img, price: price);
}

class _CartPageState extends State<CartPage> {
  final String source;
  final String dest;
  final String img;
  final String price;

  _CartPageState({
    required this.dest,
    required this.source,
    required this.img,
    required this.price,
  });

  late int totalPrice = int.parse(price);
  int count = 1;
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
            SizedBox(
              height: 14,
            ),
            Padding(
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
            Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 246, 232, 219),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(img),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(10),
                      // color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Source: $source',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Dest: $dest',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Price: ₹$price',
                              style: const TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Text(
                            "No. of tourist",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 18),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      count == 1
                                          ? Utils()
                                              .toastMessage("Can't be Zero")
                                          : setState(() {
                                              count--;
                                              totalPrice =
                                                  count * int.parse(price);
                                            });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    count.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      count > 5
                                          ? Utils().toastMessage(
                                              "Maximum Limit Exceeded")
                                          : setState(() {
                                              count++;
                                              totalPrice =
                                                  count * int.parse(price);
                                            });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 251, 224, 211),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(
                15,
              ),
            ),
          ),
          padding: EdgeInsets.all(10),
          height: 130,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Total : ₹$totalPrice",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetails(
                        source: source,
                        dest: dest,
                        tourist: count.toString(),
                      ),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(
                      18,
                    ),
                  ),
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
