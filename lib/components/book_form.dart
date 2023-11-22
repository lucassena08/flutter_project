import 'package:flutter/material.dart';

class BookForm extends StatelessWidget {
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
    final date = DateTime.now();

    if (title.isEmpty || author.isEmpty) {
      return;
    }

    onSubmit(title, author, date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              onFieldSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                hintText: 'Titulo',
              ),
            ),
            TextFormField(
              controller: authorController,
              onFieldSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                hintText: 'Autor',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
          ],
        ),
      ),
    );
  }
}
