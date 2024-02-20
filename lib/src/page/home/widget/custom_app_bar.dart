import 'package:book_buddy_app/src/page/home/widget/search_book.dart';
import 'package:book_buddy_app/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Image(
                image: AssetImage("assets/images/logo.png"),
                height: 60,
                width: 60,
              ),
              Text(
                "Book Buddy",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchBook()));
                  },
                  icon: const Icon(Icons.search_rounded)),
              IconButton(
                  onPressed: () {
                    settingsController.updateThemeMode(
                        settingsController.themeMode == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light);
                  },
                  icon: Icon(settingsController.themeMode == ThemeMode.light
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded))
            ],
          ),
        ],
      ),
    );
  }
}
