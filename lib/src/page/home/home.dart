import 'package:book_buddy_app/src/page/home/widget/all_books.dart';
import 'package:book_buddy_app/src/page/home/widget/profile.dart';
import 'package:book_buddy_app/src/page/home/widget/upcoming_books.dart';
import 'package:book_buddy_app/src/page/home/widget/custom_app_bar.dart';
import 'package:book_buddy_app/src/page/home/widget/recommended_books.dart';
import 'package:book_buddy_app/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(settingsController: widget.settingsController),
          ComingBook(),
          RecommendedBook(settingsController: widget.settingsController),
          AllBooks(settingsController: widget.settingsController)
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0xFF6741FF),
        onTap: (index) {
          setState(() {
            currentIndex = index;
            if (index == 0) {
              _navigateToHomePage();
            } else if (index == 3) {
              _navigateToProfilePage();
            }
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
              label: "Book", icon: Icon(Icons.menu_book_rounded)),
          BottomNavigationBarItem(
              label: "Column", icon: Icon(Icons.view_week_rounded)),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person_outline),
          )
        ]);
  }

  void _navigateToHomePage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomePage(settingsController: widget.settingsController)));
  }

  void _navigateToProfilePage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ProfilePage(settingsController: widget.settingsController)));
  }
}
