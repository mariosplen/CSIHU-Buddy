class Announcement {
  String id;
  String title;
  String author;
  DateTime date;
  String content;
  List<String> attachments;

  Announcement({
    required this.id,
    required this.title,
    required this.author,
    required this.date,
    required this.content,
    required this.attachments,
  });

  static List<Announcement> announcements = [];
}
