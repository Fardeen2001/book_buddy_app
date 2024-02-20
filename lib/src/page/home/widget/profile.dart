import 'package:book_buddy_app/src/page/authentication/login.dart';
import 'package:book_buddy_app/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var userName, userEmail;

  @override
  void initState() {
    _getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: const Color(0xFF6741FF),
              child: Text(
                userName[0],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            itemProfile(userName!, Icons.person_rounded),
            const SizedBox(
              height: 20,
            ),
            itemProfile(userEmail!, Icons.email_rounded),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => logoutUser(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6741FF)),
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  itemProfile(String title, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10),
        ],
      ),
      child: ListTile(
        title: Text(title),
        leading: Icon(iconData),
      ),
    );
  }

  void _getUserData() async {
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString("userName") ?? "fardeen";
    var getEmail = prefs.getString("email") ?? "fardeenahamed2001@gmail.com";

    setState(() {
      userName = getName;
      userEmail = getEmail;
    });
  }

  logoutUser() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove("userName");
    prefs.remove("email");
    prefs.remove("password");
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LoginScreen(settingsController: widget.settingsController)));
  }
}
