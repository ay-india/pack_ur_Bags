import 'package:flutter/material.dart';
import 'package:packs_your_bag/screens/payment_page.dart';
import 'package:packs_your_bag/utils/utils.dart';
import 'package:packs_your_bag/widgets/sign_in_button.dart';
import 'package:packs_your_bag/widgets/user_auth_input.dart';

class UserDetails extends StatefulWidget {
  final String source;
  final String dest;
  final String tourist;
  const UserDetails({super.key,required this.source,required this.dest,required this.tourist});

  @override
  State<UserDetails> createState() => _UserDetailsState(source: source,dest: dest,tourist: tourist);
}

class _UserDetailsState extends State<UserDetails> {
  final String source;
  final String dest;
  final String tourist;
 _UserDetailsState({required this.source,required this.dest,required this.tourist});
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController mnController = TextEditingController();
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
                "Enter Details: ",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          UserAuthInput(
              hintText: "Name", obscureText: false, controller: nameController),
          UserAuthInput(
              hintText: "Date", obscureText: false, controller: dateController),
          UserAuthInput(
              hintText: "Mobile Number",
              obscureText: false,
              controller: mnController),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              nameController.text.toString().isNotEmpty &&
                      dateController.text.toString().isNotEmpty &&
                      mnController.text.toString().isNotEmpty
                  ? Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentPage(name: nameController.text.toString(), date: dateController.text.toString(),mobile: mnController.text.toString(),source: source,dest: dest,tourist: tourist,)))
                  : Utils().toastMessage("Give Correct Details");
            },
            child: Container(
              margin: EdgeInsets.all(12),
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.deepOrange),
              child: Center(
                  child: Text(
                "Proceed for Payment",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
        
        ]),
      ),
    );
  }
}
