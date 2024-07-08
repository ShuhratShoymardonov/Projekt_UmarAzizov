import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:umar_azizov/papka/Uvedomilni_Page.dart';

class Kurs extends StatefulWidget {
  const Kurs({super.key});

  @override
  State<Kurs> createState() => _KursState();
}

class _KursState extends State<Kurs> {
  List user = [
    {
      'id': '1',
      'title': 'Анатомия',
      'lessons': '20 ',
      'duration': '34 ч',
      'image': "images/Anatomy.png",
    },
    {
      'id': '2',
      'title': 'Шиши нав',
      'lessons': '14 ',
      'duration': '27 ч',
      'image': "images/Breath 1.png",
    },
    {
      'id': '3',
      'title': 'Шиш',
      'lessons': '23 ',
      'duration': '39 ч',
      'image': "images/image 98.png",
    },
    {
      'id': '4',
      'title': 'Сутунмухра',
      'lessons': '13 ',
      'duration': '21 ч',
      'image': "images/Spine (1).png",
    },
    {
      'id': '5',
      'title': 'Анатомия',
      'lessons': '20 ',
      'duration': '34 ч',
      'image': "images/Anatomy.png",
    },
    {
      'id': '6',
      'title': 'Шиши нав',
      'lessons': '14 ',
      'duration': '27 ч',
      'image': "images/Breath 1.png",
    },
    {
      'id': '7',
      'title': 'Шиш',
      'lessons': '23 ',
      'duration': '39 ч',
      'image': "images/Breath 1.png",
    },
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   getAllUser();
  // }

  // Future getAllUser() async {
  //   var get = await http.get(
  //     Uri.parse("https://reqres.in/api/users?page=1"),
  //   );
  //   if (get.statusCode == 200) {
  //     var res = json.decode(get.body);
  //     setState(() {
  //       user = res['data'];
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Курсы",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Uvedomilno(),
                    ),
                  );
                },
                icon: Icon(Icons.notifications_none_outlined),
              ),
            ],
          ),
        ),
        body: user.isEmpty
            ? Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 100.0,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(110, 17, 24, 39),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      width: 158,
                      height: 194,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "${user[index]['image']}",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 140,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 5),
                            child: Text(
                              "${user[index]['title']} ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff262626),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.play_circle_outline,
                                    size: 15,
                                    color: Color(0xff1780C2),
                                  ),
                                  Text(
                                    " ${user[index]["lessons"]} уроков ",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff737373),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 3,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: Color(0xff737373),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Icon(
                                      Icons.access_time,
                                      size: 15,
                                      color: Color(0xffF97316),
                                    ),
                                  ),
                                  Text(
                                    " ${user[index]["duration"]} ",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff737373),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
