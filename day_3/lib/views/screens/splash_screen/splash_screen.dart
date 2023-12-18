import 'package:flutter/material.dart';
import 'package:day_3/views/screens/home_screen/index.dart';
import 'package:day_3/views/screens/login_screen/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () async {
      SharedPreferences shPref = await SharedPreferences.getInstance();
      if (shPref.getString("login") != "true") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Expanded(
                child: Center(
              child: Image.asset(
                "images/appstore.png",
                height: 150,
                width: 150,
              ),
            )),
            Text(
              "Developed By MennaTullah El-Attar",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
