import 'package:book_buddy_app/src/model/book.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  final Book book;

  const BookDetail({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 550,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(30)),
                  child: Image.asset(
                    book.imageUrl!,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                    top: 56,
                    left: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Text(
                  book.title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                book.author!,
                style: const TextStyle(color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        color: book.available! ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: book.genre!
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Chip(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            label: Text(e),
                          ),
                        ))
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  book.description!,
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(
                        Icons.add, Colors.grey.shade800, "Add To Library"),
                    _buildButton(Icons.menu_book_rounded,
                        const Color(0xFF6741FF), "Read Now")
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, Color color, String text) {
    return SizedBox(
        height: 40,
        width: 160,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ));
  }
}
