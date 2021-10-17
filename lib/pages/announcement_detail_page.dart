import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:google_fonts/google_fonts.dart';

import '/data/models/announcement.dart';

class AnnouncementDetailPage extends StatefulWidget {
  const AnnouncementDetailPage({Key? key, required this.announcement})
      : super(key: key);

  final Announcement announcement;

  @override
  State<AnnouncementDetailPage> createState() => _AnnouncementDetailPageState();
}

class _AnnouncementDetailPageState extends State<AnnouncementDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            widget.announcement.title,
            style: GoogleFonts.roboto(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          Row(
            children: [
              Text('By ${widget.announcement.author}'),
              Text(widget.announcement.date.toString()),
            ],
          ),
          Html(data: widget.announcement.content),
        ],
      ),
    );
  }
}
