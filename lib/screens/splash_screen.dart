import 'package:flutter/material.dart';
import 'package:packs_your_bag/auth/splash_services.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      // navigateAfterSeconds: new ,
      title: new Text(
        'Pack Your Bags',
        textScaleFactor: 2,
      ),
      image: new Image.asset('asset/images/splash.jpeg'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}
