class Book {
  final String id;
  final String title;
  final String author;
  final DateTime dateOfRelease;
  bool marked = false;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.dateOfRelease,
    required this.marked,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      dateOfRelease: DateTime.parse(json['dateOfRelease']),
      marked: json['marked'],
    );
  }
}
