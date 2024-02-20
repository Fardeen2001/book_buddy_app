import 'package:book_buddy_app/src/model/book.dart';
import 'package:book_buddy_app/src/page/authentication/login.dart';
import 'package:book_buddy_app/src/page/detail/book_detail.dart';
import 'package:book_buddy_app/src/page/home/widget/category_heading.dart';
import 'package:book_buddy_app/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllBooks extends StatefulWidget {
  const AllBooks({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  State<AllBooks> createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {
  final allBooksList = Book.generateAllBooks();
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
        const CategoryHeading(title: "All Books"),
        ListView.separated(
            padding: const EdgeInsets.all(20),
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final book = allBooksList[index];
              return GestureDetector(
                onTap: () {
                  if (!book.available!) return;
                  if (isUserLoggedIn) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BookDetail(book: book)));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginScreen(
                            settingsController: widget.settingsController)));
                  }
                },
                child: SizedBox(
                  height: 120,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(book.imageUrl!),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text(
                                book.title!,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ))
                            ],
                          ),
                          Text(
                            book.author!,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            book.description!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange.shade300,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "${book.rating!}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                book.available! ? "Available" : "Not Available",
                                style: TextStyle(
                                    color: book.available!
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      )),
                      Icon(
                        Icons.bookmark_border_rounded,
                        color: Colors.orange.shade300,
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: allBooksList.length)
      ],
    );
  }

  void _getUserLoggedIn() async {
    var prefs = await SharedPreferences.getInstance();

    var isLoggedInData = prefs.getBool("isLoggedIn");
    isUserLoggedIn = isLoggedInData;
  }
}
