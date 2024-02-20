import 'package:book_buddy_app/src/model/book.dart';
import 'package:book_buddy_app/src/page/authentication/login.dart';
import 'package:book_buddy_app/src/page/detail/book_detail.dart';
import 'package:book_buddy_app/src/page/home/widget/category_heading.dart';
import 'package:book_buddy_app/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecommendedBook extends StatefulWidget {
  const RecommendedBook({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  State<RecommendedBook> createState() => _RecommendedBookState();
}

class _RecommendedBookState extends State<RecommendedBook> {
  final recommendedList = Book.generateRecommendedBooks();
  var isUserLoggedIn;

  @override
  void initState() {
    _getUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoryHeading(title: "Recommended for you"),
        SizedBox(
          height: 250,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                var book = recommendedList[index];

                return GestureDetector(
                  onTap: () {
                    if(!book.available!)return;
                    if (isUserLoggedIn) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookDetail(book: book)));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen(
                              settingsController: widget.settingsController)));
                    }
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                book.imageUrl!,
                                fit: BoxFit.cover,
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                book.title!,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              book.author!,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text(
                              book.available! ? "Available" : "Not Available",
                              style: TextStyle(
                                  color: book.available!
                                      ? Colors.green
                                      : Colors.red),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          top: 10,
                          left: 10,
                          child: _buildIconText(Icons.star,
                              Colors.orange.shade300, "${book.rating!}"))
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                  ),
              itemCount: recommendedList.length),
        )
      ],
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 14,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          )
        ],
      ),
    );
  }

  void _getUserLoggedIn() async {
    var prefs = await SharedPreferences.getInstance();

    var isLoggedInData = prefs.getBool("isLoggedIn");
    isUserLoggedIn = isLoggedInData;
  }
}
