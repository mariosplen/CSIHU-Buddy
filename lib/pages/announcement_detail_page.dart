import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:path/path.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            widget.announcement.title,
            style: GoogleFonts.roboto(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          Row(children: [
            Text(
              'By ${widget.announcement.author}',
              style: GoogleFonts.openSans(
                color: Colors.blueGrey,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${widget.announcement.date.day.toString().padLeft(2, '0')}/${widget.announcement.date.month.toString().padLeft(2, '0')}/${widget.announcement.date.year.toString()} ${widget.announcement.date.hour.toString().padLeft(2, '0')}:${widget.announcement.date.minute.toString().padLeft(2, '0')}',
              style: GoogleFonts.openSans(
                color: Colors.blueGrey,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ]),
          Expanded(
            child: Html(data: widget.announcement.content),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.amber),
            width: 80,
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.announcement.attachments.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(basename(widget.announcement.attachments[index])),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ListView(
//             padding: EdgeInsets.all(10),
//             children: [
//               Text(
//                 widget.announcement.title,
//                 style: GoogleFonts.roboto(
//                   color: Colors.black87,
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'By ${widget.announcement.author}',
//                     style: GoogleFonts.openSans(
//                       color: Colors.blueGrey,
//                       fontSize: 14,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     '${widget.announcement.date.day.toString().padLeft(2, '0')}/${widget.announcement.date.month.toString().padLeft(2, '0')}/${widget.announcement.date.year.toString()} ${widget.announcement.date.hour.toString().padLeft(2, '0')}:${widget.announcement.date.minute.toString().padLeft(2, '0')}',
//                     style: GoogleFonts.openSans(
//                       color: Colors.blueGrey,
//                       fontSize: 14,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                 ],
//               ),
//               Html(data: widget.announcement.content),
//             ],
//           ),
//           Container(
//             height: 100,
//             width: 100,
//             child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 itemCount: widget.announcement.attachments.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     title:
//                         Text(basename(widget.announcement.attachments[index])),
//                   );
//                 }),
//           )
//         ],
