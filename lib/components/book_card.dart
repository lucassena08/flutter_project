import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/components/book_form.dart';
import 'package:flutter_project/components/book_list.dart';
import 'package:flutter_project/model/book.dart';

class BookCard extends StatefulWidget {
  const BookCard({super.key});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  // Livros iniciais -- TODO: ler de um json
  final _books = [
    Book(
        id: 'b1',
        title: 'Harry Potter e a Pedra Filosofal',
        author: 'J.K. Rowling',
        dateOfRelease: DateTime(1997, 06)),
    Book(
        id: 'b2',
        title: 'Harry Potter e a Câmara Secreta',
        author: 'J.K. Rowling',
        dateOfRelease: DateTime(1998, 07)),
  ];

  _addBook(String title, String author, DateTime dateOfRelease) {
    final newBook = Book(
        id: Random().nextDouble().toString(),
        title: title,
        author: author,
        dateOfRelease: dateOfRelease);

    setState(() {
      _books.add(newBook);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [BookForm(onSubmit: _addBook), BookList(books: _books)],
    );
  }
}
