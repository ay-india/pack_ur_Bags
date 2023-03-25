import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:packs_your_bag/screens/history_page.dart';
import 'package:packs_your_bag/screens/login.dart';
import 'package:packs_your_bag/screens/package_page.dart';
import 'package:packs_your_bag/utils/utils.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ref = FirebaseDatabase.instance.ref('packages');
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pack Your Bags'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                    builder: (context) => HistoryPage(),
                  ),
                );
              },
              icon: Icon(Icons.shopping_basket)),
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            icon: const Icon(
              Icons.logout_outlined,
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            // color: Colors.green,
            // height: 50,
            child: const Text(
              "Welcome, Ashish",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const Divider(),
          const Text(
            "Browse Packages",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
//--------------------------------------------------------------
// used firebaseAnimatedList
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PackagePage(
                            day: snapshot.child('day').value.toString(),
                            img: snapshot.child('img').value.toString(),
                            source: snapshot.child('source').value.toString(),
                            dest:
                                snapshot.child('destination').value.toString(),
                            cab: snapshot.child('cab').value.toString(),
                            flight: snapshot.child('flights').value.toString(),
                            hotel: snapshot.child('hotels').value.toString(),
                            price: snapshot.child('price').value.toString(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 246, 235, 235),
                      ),
                      padding: EdgeInsets.all(10),
                      height: 220,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(8),
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    snapshot.child('img').value.toString()),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(10),
                              // color: Colors.green,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Source: ${snapshot.child('source').value.toString()}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Dest: ${snapshot.child('destination').value.toString()}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Price: ${snapshot.child('price').value.toString()}',
                                      style: const TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Text(
                                        'View more details',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),

          //-------------------------------------------------------------

          /// using Stream Builder
          // Expanded(
          //     child: StreamBuilder(
          //   stream: ref.onValue,
          //   builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          //     if (!snapshot.hasData) {
          //       return Center(child: CircularProgressIndicator());
          //     } else {
          //       Map<dynamic, dynamic> map =
          //           snapshot.data!.snapshot.value as dynamic;
          //       List<dynamic> list = [];
          //       print(list);
          //       list.clear();
          //       list = map.values.toList();
          //       return ListView.builder(
          //           itemCount: snapshot.data!.snapshot.children.length,
          //           itemBuilder: (context, index) {
          //             return ListTile(
          //               title: Text(list[index]['source']),
          //             );
          //           });
          //     }
          //   },
          // )),

          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
