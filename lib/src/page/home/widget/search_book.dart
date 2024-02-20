import 'package:book_buddy_app/src/model/book.dart';
import 'package:book_buddy_app/src/page/detail/book_detail.dart';
import 'package:flutter/material.dart';

class SearchBook extends StatefulWidget {
  const SearchBook({super.key});

  @override
  State<SearchBook> createState() => _SearchBookState();
}

class _SearchBookState extends State<SearchBook> {
  final allBooksList = Book.generateAllBooks();

  //var filteredBook;
  var filteredBook = <Book>[];

  void updateList(String searchedValue) {
    if (allBooksList.isNotEmpty || searchedValue.isNotEmpty) {
      setState(() {
        filteredBook = allBooksList
            .where((element) =>
                element.title!
                    .toLowerCase()
                    .contains(searchedValue.toLowerCase()) ||
                element.author!
                    .toLowerCase()
                    .contains(searchedValue.toLowerCase()) ||
                (element.available! &&
                    searchedValue.toLowerCase() == 'available') ||
                (!element.available! &&
                    searchedValue.toLowerCase() == 'not available'))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a Book",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (searchedValue) => updateList(searchedValue),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 30,
                  ),
                  hintText: "Search book here...",
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final book = filteredBook[index];
                    return GestureDetector(
                      onTap: () {
                        if (!book.available!) return;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookDetail(book: book)));
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(
                                      book.title!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      book.available!
                                          ? "Available"
                                          : "Not Available",
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
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: filteredBook.length),
            )
          ],
        ),
      ),
    );
  }
}
