import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/components/book_form.dart';
import 'package:flutter_project/components/book_list.dart';
import 'package:flutter_project/model/book.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class BookCard extends StatefulWidget {
  const BookCard({super.key});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  final List<Book> _books = [];

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  _loadBooks() async {
    Future<String> getJson() {
      return rootBundle.loadString('lib/model/books.json');
    }

    List<dynamic> jsonList = json.decode(await getJson());
    List<Book> books = jsonList.map((json) => Book.fromJson(json)).toList();

    setState(() {
      _books.addAll(books);
    });
  }

  _addBook(String title, String author, DateTime dateOfRelease) {
    final newBook = Book(
      id: Random().nextDouble().toString(),
      title: title,
      author: author,
      dateOfRelease: dateOfRelease,
      marked: false,
    );

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
