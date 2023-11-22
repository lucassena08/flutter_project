import 'package:flutter/material.dart';
import 'package:flutter_project/model/book.dart';
import 'package:intl/intl.dart';

class BookList extends StatelessWidget {
  final List<Book> books;

  const BookList({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (ctx, index) {
            final bk = books[index];
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    )),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Teste',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bk.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(DateFormat('d MMM y').format(bk.dateOfRelease),
                          style: const TextStyle(
                            color: Colors.grey,
                          )),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
