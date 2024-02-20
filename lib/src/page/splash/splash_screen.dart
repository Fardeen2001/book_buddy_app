import 'dart:async';
import 'package:book_buddy_app/src/page/authentication/signup.dart';
import 'package:book_buddy_app/src/page/home/home.dart';
import 'package:book_buddy_app/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? userName;
  String? email;
  String? password;

  @override
  void initState() {
    super.initState();
    loadUserLoggedIn();
  }

  Future<void> loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName');
      email = prefs.getString('email');
      password = prefs.getString('password');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.deepPurple.shade400,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/images/logo.png")),
              SizedBox(
                height: 20,
              ),
              Text(
                "Book Buddy",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  void loadUserLoggedIn() async {
    var prefs = await SharedPreferences.getInstance();
    var isLoggedIn = prefs.getBool("isLoggedIn");

    Timer(const Duration(seconds: 5), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomePage(settingsController: widget.settingsController)),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => SignupScreen(
                    settingsController: widget.settingsController)),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SignupScreen(settingsController: widget.settingsController)),
        );
      }
    });
  }
}
