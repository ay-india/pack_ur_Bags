import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:packs_your_bag/screens/home_page.dart';
import 'package:packs_your_bag/screens/sign_up.dart';
import 'package:packs_your_bag/utils/utils.dart';
import 'package:packs_your_bag/widgets/sign_in_button.dart';
import 'package:packs_your_bag/widgets/user_auth_input.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loading = false;
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 232, 230, 230),
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(children: [
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    //
                  ],
                ),

                SizedBox(
                  height: 21,
                ),
                // Email box
                UserAuthInput(
                  hintText: 'Email address',
                  obscureText: false,
                  controller: emailController,
                ),
                // const SizedBox(
                //   height: 4,
                // ),
                // password box
                UserAuthInput(
                  hintText: 'Password',
                  obscureText: true,
                  controller: passwordController,
                ),
                //forgot password
                SizedBox(
                  height: 15,
                ),
                //Signin button
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        loading = true;
                      });
                      _auth
                          .signInWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString())
                          .then((value) {
                        Utils().toastMessage(value.user!.email.toString() +
                            " Successfully login");
                        setState(() {
                          loading = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }).onError((error, stackTrace) {
                        Utils().toastMessage(error.toString());
                        setState(() {
                          loading = false;
                        });
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: loading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70),
                            ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_box_outline_blank,
                        ),
                        Text("Remember me"),
                      ],
                    ),
                    Text(
                      'Lost your password?',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
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
                    const Text(' or Login via '),
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
                        "Not a member yet,",
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
                                  builder: (context) => RegisterPage()));
                        },
                        child: Text(
                          'Create an Account',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              // ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
