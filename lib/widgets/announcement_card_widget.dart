import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

import '/data/author_images.dart';
import '/data/models/announcement.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({
    Key? key,
    required this.announcement,
  }) : super(key: key);

  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Colors.black38,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(authorImages[
                          announcement.author] ??
                      'https://studyingreece.edu.gr/wp-content/uploads/2021/05/International_Hellenic_University_logo.jpg')),
              const SizedBox(
                width: 6,
              ),
              Text(
                announcement.author,
                style: GoogleFonts.openSans(
                  color: Colors.blueGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  announcement.title,
                  style: GoogleFonts.roboto(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Html(
              data: announcement.content,
              style: {
                "p": Style(
                  color: Colors.blueGrey,
                )
              },
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Text(
                timeago.format(announcement.date, locale: 'el'),
                style: GoogleFonts.openSans(
                  color: Colors.blueGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
