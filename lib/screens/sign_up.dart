import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:packs_your_bag/screens/login.dart';
import 'package:packs_your_bag/utils/utils.dart';
import 'package:packs_your_bag/widgets/sign_in_button.dart';
import 'package:packs_your_bag/widgets/user_auth_input.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var loading = false;
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //register page
        // resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 232, 230, 230),
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.deepOrange,
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Row(
                        children: const [
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
                    height: 18,
                  ),
                  //welcome text
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      //
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  // Email box
                  UserAuthInput(
                    hintText: 'Email address',
                    obscureText: false,
                    controller: emailController,
                  ),

                  // password box
                  UserAuthInput(
                    hintText: 'Password',
                    obscureText: true,
                    controller: passwordController,
                  ),
                  UserAuthInput(
                    hintText: 'Confirm Password',
                    obscureText: true,
                    controller: confirmPasswordController,
                  ),
                  SizedBox(
                    height: 6,
                  ),

                  SizedBox(
                    height: 24,
                  ),

                  //Signup button
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          loading = true;
                        });
                        _auth
                            .createUserWithEmailAndPassword(
                                email: emailController.text.toString(),
                                password: passwordController.text.toString())
                            .then((value) {
                          Utils().toastMessage(value.user!.email.toString() +
                              " registered Successfully.");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                          setState(() {
                            loading = false;
                          });
                        }).onError((error, stackTrace) {
                          Utils().toastMessage(error.toString());
                          setState(() {
                            loading = false;
                          });
                        });
                      },
                      child: Container(
                        // color: Colors.orange,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(
                            6,
                          ),
                        ),
                        child: loading
                            ? const CircularProgressIndicator(
                                color: Colors.white70,
                              )
                            : const Text(
                                'REGISTER',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                  //or sign in with
                  SizedBox(
                    height: 29,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Text(' or Login via '),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // google and apple authentication
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const SigninButton(
                          image: 'asset/images/google.png',
                          text: 'Sign in with Google',
                        ),
                      ),
                    ],
                  ),

                  // not a member
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                    child: Row(
                      children: [
                        Text(
                          "Already have an account,",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            'Login here',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
