import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:umar_azizov/papka/Chashm_page.dart';
import 'package:flick_video_player/flick_video_player.dart';

class VideoCursPage extends StatefulWidget {
  const VideoCursPage({Key? key}) : super(key: key);

  @override
  _VideoCursPageState createState() => _VideoCursPageState();
}

class _VideoCursPageState extends State<VideoCursPage> {
  late FlickManager flickManager;

  bool like = false, dizlayk = false;
  int likage = 0, dizage = 0;

  bool napisat = true;

  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> comments = [];

  void addComment(String text) {
    setState(() {
      comments.add({
        "author": "Umar Azizov",
        "date": "${DateFormat('dd MMM yyyy, HH:mm').format(DateTime.now())}",
        "content": text,
      });
      _controller.clear();
      napisat = !napisat;
    });
  }

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset(
        "vodeo/bee.mp4",
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.white,
                context: context,
                builder: (context) => ShowModlBotton(),
              );
            },
            icon: Icon(
              Icons.format_list_bulleted,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Майна",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    width: 328,
                    height: 200,
                    child: FlickVideoPlayer(
                      flickManager: flickManager,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (like) {
                              likage--;
                            } else {
                              likage++;
                              if (dizlayk) {
                                dizage--;
                                dizlayk = false;
                              }
                            }
                            like = !like;
                          });
                        },
                        child: Container(
                          width: 68,
                          height: 38,
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: Color(0xffE0F2FE),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                like
                                    ? Icons.thumb_up
                                    : Icons.thumb_up_off_alt_outlined,
                                color: Color(0xff1780C2),
                                size: 20,
                              ),
                              Text(
                                '$likage',
                                style: TextStyle(
                                  color: Color(0xff1780C2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (dizlayk) {
                              dizage--;
                            } else {
                              dizage++;
                              if (like) {
                                likage--;
                                like = false;
                              }
                            }
                            dizlayk = !dizlayk;
                          });
                        },
                        child: Container(
                          width: 68,
                          height: 38,
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 254, 224, 224),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                dizlayk
                                    ? Icons.thumb_down
                                    : Icons.thumb_down_outlined,
                                color: Color(0xffDC2626),
                                size: 20,
                              ),
                              Text(
                                '$dizage',
                                style: TextStyle(
                                  color: Color(0xffDC2626),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 8.0),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 4.0),
                      Text('25', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              Container(
                width: 328,
                height: 277,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffF3F4F6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: napisat
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Комментарии (${comments.length})",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      napisat = !napisat;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 95,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff1780C2),
                                      ),
                                    ),
                                    child: Text(
                                      "Написать",
                                      style: TextStyle(
                                        color: Color(0xff1780C2),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: comments.isNotEmpty
                                  ? ListView.builder(
                                      itemCount: comments.length,
                                      itemBuilder: (context, index) {
                                        final comment = comments[index];
                                        return Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      "images/UmarAzizov.png"),
                                                ),
                                                SizedBox(width: 5),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      comment["author"]!,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      comment["date"]!,
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                    SizedBox(height: 7),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 7),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                comment["content"]!,
                                              ),
                                            ),
                                            SizedBox(height: 30),
                                            Divider(
                                              color: Color.fromARGB(
                                                  255, 230, 229, 229),
                                              height: 1,
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        );
                                      },
                                    )
                                  : Center(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.forum_outlined,
                                            color: Colors.grey,
                                            size: 70,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Пока комментариев нет!",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Комментарии",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: _controller,
                              maxLines: 5,
                              minLines: 3,
                              decoration: InputDecoration(
                                labelText: 'Введите текст',
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff1780C2),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff1780C2),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    addComment(_controller.text);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 103,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color(0xff1780C2),
                                    ),
                                    child: Text(
                                      "Отправить",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      napisat = !napisat;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 83,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: Color(0xff1780C2),
                                      ),
                                    ),
                                    child: Text(
                                      "Отмена",
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff1780C2),
                  ),
                ),
                child: Icon(
                  Icons.chevron_left_sharp,
                  color: Color(0xff1780C2),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => ShowModlBotton(),
                );
              },
              child: Container(
                width: 123,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xff1780C2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Дальше",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Color(0xffffffff),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShowModlBotton extends StatelessWidget {
  const ShowModlBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Сар",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChashmPage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                width: 320,
                height: 56,
                decoration: BoxDecoration(
                  color: Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.view_headline),
                        SizedBox(width: 5),
                        Text(
                          "Чашм",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "24:05",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff64748B),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.check_circle,
                            size: 16,
                            color: Color(0xff1780C2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoCursPage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                width: 320,
                height: 56,
                decoration: BoxDecoration(
                  color: Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.play_circle_outline),
                        SizedBox(width: 5),
                        Text(
                          "Майна",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "24:05",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff64748B),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          alignment: Alignment.center,
                          // width: 14,
                          // height: 14,
                          // decoration: BoxDecoration(
                          //   shape: BoxShape.circle,
                          //   color: Colors.white,
                          //   border: Border.all(color: Colors.grey),
                          // ),
                          child: Icon(
                            Icons.check_circle,
                            size: 16,
                            color: Color(0xff1780C2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                width: 320,
                height: 56,
                decoration: BoxDecoration(
                  color: Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.view_headline),
                        SizedBox(width: 5),
                        Text(
                          "Гуш",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "24:05",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff64748B),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          alignment: Alignment.center,
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                width: 320,
                height: 56,
                decoration: BoxDecoration(
                  color: Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.play_circle_outline),
                        SizedBox(width: 5),
                        Text(
                          "Гул",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "24:05",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff64748B),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          alignment: Alignment.center,
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                width: 320,
                height: 56,
                decoration: BoxDecoration(
                  color: Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.play_circle_outline),
                        SizedBox(width: 5),
                        Text(
                          "Бини",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "24:05",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff64748B),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          alignment: Alignment.center,
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
