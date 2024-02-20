import 'package:book_buddy_app/src/page/authentication/login.dart';
import 'package:book_buddy_app/src/page/home/home.dart';
import 'package:book_buddy_app/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  final SettingsController settingsController;

  const SignupScreen({super.key, required this.settingsController});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var userNameController, emailController, passwordController;

  @override
  void initState() {
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage("assets/images/logo.png"),
                height: 150,
              ),
              const Text(
                "Create Your Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Disclaimer: Entered data is not Authenticated.",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                        controller: userNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: "User Name",
                            prefixIcon: const Icon(Icons.person_rounded),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: const Icon(Icons.email_rounded),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
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
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.password_outlined),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.visibility),
                              onPressed: () {},
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
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
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                      settingsController:
                                          widget.settingsController)));
                        },
                        child: const Text("Already Have An Account?")),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => createUserAccount(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6741FF)),
                        child: const Text(
                          "Create Account",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void createUserAccount() async {
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
