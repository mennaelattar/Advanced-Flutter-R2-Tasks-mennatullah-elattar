import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            color: Colors.black.withOpacity(0.4),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Padding(
                  padding: const EdgeInsets.all(100),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        TextField()
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}
