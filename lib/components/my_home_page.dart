import 'package:flutter/material.dart';
import 'book_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const SizedBox(
        width: double.infinity,
        child: Text(
          'Catálogo de Livros',
          textAlign: TextAlign.center,
        ),
      ),
    );

    const column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(),
        BookCard(),
      ],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: column,
    );
  }
}
