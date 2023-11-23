import 'package:flutter/material.dart';

class BookForm extends StatelessWidget {
  final date = DateTime.now();

  final titleController = TextEditingController(),
      authorController = TextEditingController();

  final void Function(String, String, DateTime) onSubmit;

  BookForm({
    super.key,
    required this.onSubmit,
  });

  _submitForm() {
    final title = titleController.text;
    final author = titleController.text;

    if (title.isEmpty || author.isEmpty) {
      return;
    }

    onSubmit(title, author, date);
  }

  @override
  Widget build(BuildContext context) {
    var titleFormField = TextFormField(
      controller: titleController,
      onFieldSubmitted: (_) => _submitForm(),
      decoration: const InputDecoration(
        hintText: 'Título',
      ),
    );

    var authorFormField = TextFormField(
      controller: authorController,
      onFieldSubmitted: (_) => _submitForm(),
      decoration: const InputDecoration(
        hintText: 'Autor',
      ),
    );

    var textButton = TextButton(
      onPressed: () {
        final title = titleController.text;
        final value = authorController.text;

        onSubmit(title, value, date);
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(15),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      child: const Text('Novo Livro'),
    );

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            titleFormField,
            authorFormField,
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: textButton,
            ),
          ],
        ),
      ),
    );
  }
}
