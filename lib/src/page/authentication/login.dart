import 'package:book_buddy_app/src/page/authentication/signup.dart';
import 'package:book_buddy_app/src/page/home/home.dart';
import 'package:book_buddy_app/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userNameController, emailController, passwordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 56, left: 24, right: 24, bottom: 24),
          child: Column(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                      height: 150, image: AssetImage("assets/images/logo.png")),
                  Text(
                    "Welcome To Book Buddy",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("The App that has every collection of book",
                      style: TextStyle(fontSize: 12)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Disclaimer: Entered data is not Authenticated.",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: userNameController,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person_rounded),
                              labelText: "UserName",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email_rounded),
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.password_outlined),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.visibility_rounded),
                                onPressed: () {},
                              ),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Password?")),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => logginUser(),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6741FF)),
                            child: const Text(
                              "Sign in",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen(
                                        settingsController:
                                            widget.settingsController)));
                          },
                          child: const Text("Create Account"),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void logginUser() async {
    var userName = userNameController.text.toString();
    var email = emailController.text.toString();
    var password = passwordController.text.toString();

    RegExp pattern = RegExp(r'^[@.]+$');
    if (userName.length < 5 &&
        !email.contains(pattern) &&
        password.length < 5) {
      Fluttertoast.showToast(
          msg: "Enter Valid User Credentials",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      var prefs = await SharedPreferences.getInstance();
      prefs.setString("userName", userName);
      prefs.setString("email", email);
      prefs.setString("password", password);
      prefs.setBool("isLoggedIn", true);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomePage(settingsController: widget.settingsController)));
    }
  }
}
