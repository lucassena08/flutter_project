import 'package:flutter/material.dart';
import 'package:flutter_project/model/book.dart';
import 'package:intl/intl.dart';

class BookList extends StatefulWidget {
  final List<Book> books;

  const BookList({
    Key? key,
    required this.books,
  }) : super(key: key);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  bool toggleIcon = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: widget.books.length,
        itemBuilder: (ctx, index) {
          final book = widget.books[index];

          var bookDetails = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('d MMM y').format(book.dateOfRelease),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          );

          var bookMarkSection = IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              setState(() {});
            },
          );

          return Card(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  child: bookMarkSection,
                ),
                bookDetails,
              ],
            ),
          );
        },
      ),
    );
  }
}
