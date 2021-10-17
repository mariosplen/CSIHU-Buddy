class Announcement {
  String id;
  String title;
  String author;
  DateTime date;
  String content;

  Announcement({
    required this.id,
    required this.title,
    required this.author,
    required this.date,
    required this.content,
  });

  static List<Announcement> announcements = [];
}
