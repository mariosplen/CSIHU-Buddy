import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import '/pages/announcement_detail_page.dart';
import '/data/models/announcement.dart';
import '/widgets/announcement_card_widget.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  void fetchLatest10() async {
    final response =
        await http.get(Uri.parse('https://cs.ihu.gr/announcements.xhtml'));
    if (response.statusCode == 200) {
      latestId = int.parse((parse(response.body).querySelector('.btn'))!
          .attributes['href']!
          .substring(27));
      fetch10ById(latestId);
    } else {
      throw Exception('latest Id not found');
    }
  }

  void fetch10ById(int id) async {
    DateTime dateTime;
    List<Announcement> announcementBuffer = [];
    String dirtyAuthorAndDate;
    List<String> authorAndDate;
    String durtyTitle;
    String title;
    String contentHTML;

    initializeDateFormatting('el');
    final format = DateFormat('d MMM yyyy HH:mm', 'el');
    var times = 10;
    while (id > 0 && times > 0) {
      times--;
      final response = await http.get(Uri.parse(
          'https://cs.ihu.gr/view_announcement.xhtml?id=' + id.toString()));
      if (response.statusCode == 200) {
        var data = parse(response.body);
        dirtyAuthorAndDate = data
            .querySelector('div#headerColumn > span')!
            .nodes
            .elementAt(1)
            .toString();
        authorAndDate = dirtyAuthorAndDate
            .substring(2, dirtyAuthorAndDate.length - 1)
            .split(' - ');
        if (authorAndDate[0] != 'NULL DATE') {
          dateTime = format.parse(authorAndDate[0]);
        } else {
          id--;
          continue;
        }
        durtyTitle = data
            .querySelector('div#headerColumn  strong ')!
            .nodes
            .elementAt(0)
            .toString();
        title = durtyTitle.substring(2, durtyTitle.length - 2).trim();
        contentHTML = data.querySelector('#j_idt33_editor')!.innerHtml;
        //List<String> attachments = [];
        setState(() {
          announcementBuffer.add(Announcement(
            id: id.toString(),
            title: title,
            author: authorAndDate[1],
            date: dateTime,
            content: contentHTML,
          ));
        });
      }
      id--;
    }
    setState(() {
      Announcement.announcements.addAll(announcementBuffer);
    });
  }

  int latestId = 0;
  int page = 0;

  @override
  void initState() {
    super.initState();
    fetchLatest10();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ανακοινώσεις'),
      ),
      body: SafeArea(
        child: Announcement.announcements.isEmpty
            ? Center(
                child: IconButton(
                onPressed: fetchLatest10,
                icon: const Icon(Icons.refresh_rounded),
              ))
            : ListView.builder(
                itemCount: Announcement.announcements.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: AnnouncementCard(
                        announcement: Announcement.announcements[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // 10
                            return AnnouncementDetailPage(
                                announcement:
                                    Announcement.announcements[index]);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
