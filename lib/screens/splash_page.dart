import 'dart:async';

import 'package:ecommerceapp/Auth/login_page.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),() => Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context)=> LoginPage() ),
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            )),
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: const SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Audio",
                    style: TextStyle(
                        letterSpacing: 5,
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "It's modular and designed to last",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 550,),
                  CircularProgressIndicator(color: Colors.white,)

                ],
              ),

          ),
        ),
      ),
    );
  }
}
