import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Kurs extends StatefulWidget {
  const Kurs({super.key});

  @override
  State<Kurs> createState() => _KursState();
}

class _KursState extends State<Kurs> {
  List user = [];

  @override
  void initState() {
    super.initState();
    getAllUser();
  }

  Future getAllUser() async {
    var get = await http.get(
      Uri.parse("https://reqres.in/api/users?page=1"),
    );
    if (get.statusCode == 200) {
      var res = json.decode(get.body);
      setState(() {
        user = res['data'];
      });
    }
  }

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
              Icon(Icons.notifications_none_outlined),
            ],
          ),
        ),
        body: user.isEmpty
            ? SpinKitFadingCircle(
                color: Colors.blue,
                size: 100.0,
              )
            : ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
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
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "${user[0]['avatar']}",
                                    fit: BoxFit.cover,
                                    width: 168,
                                    height: 140,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 5),
                                      child: Text(
                                        user.isNotEmpty
                                            ? "${user[0]['first_name']} ${user[0]['last_name']}"
                                            : "Loading...",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff262626),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_circle_outline,
                                              size: 15,
                                              color: Color(0xff1780C2),
                                            ),
                                            Text(
                                              " 20 уроков ",
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
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Icon(
                                                Icons.access_time,
                                                size: 15,
                                                color: Color(0xffF97316),
                                              ),
                                            ),
                                            Text(
                                              " 16 ч ",
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
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
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
                            width: 154,
                            height: 194,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "${user[1]['avatar']}",
                                    fit: BoxFit.cover,
                                    width: 156,
                                    height: 140,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 5),
                                      child: Text(
                                        "${user[1]['first_name']} ${user[1]['last_name']}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff262626),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_circle_outline,
                                              size: 15,
                                              color: Color(0xff1780C2),
                                            ),
                                            Text(
                                              " 20 уроков ",
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
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Icon(
                                                Icons.access_time,
                                                size: 15,
                                                color: Color(0xffF97316),
                                              ),
                                            ),
                                            Text(
                                              " 16 ч ",
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
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
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "${user[2]['avatar']}",
                                    fit: BoxFit.cover,
                                    width: 168,
                                    height: 140,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 5),
                                      child: Text(
                                        "${user[2]['first_name']} ${user[3]['last_name']}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff262626),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_circle_outline,
                                              size: 15,
                                              color: Color(0xff1780C2),
                                            ),
                                            Text(
                                              " 20 уроков ",
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
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Icon(
                                                Icons.access_time,
                                                size: 15,
                                                color: Color(0xffF97316),
                                              ),
                                            ),
                                            Text(
                                              " 16 ч ",
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
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
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
                            width: 154,
                            height: 194,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "${user[3]['avatar']}",
                                    fit: BoxFit.cover,
                                    width: 156,
                                    height: 140,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 5),
                                      child: Text(
                                        "${user[1]['first_name']} ${user[3]['last_name']}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff262626),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_circle_outline,
                                              size: 15,
                                              color: Color(0xff1780C2),
                                            ),
                                            Text(
                                              " 20 уроков ",
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
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Icon(
                                                Icons.access_time,
                                                size: 15,
                                                color: Color(0xffF97316),
                                              ),
                                            ),
                                            Text(
                                              " 16 ч ",
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
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
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "${user[4]['avatar']}",
                                    fit: BoxFit.cover,
                                    width: 168,
                                    height: 140,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 5),
                                      child: Text(
                                        "${user[1]['first_name']} ${user[4]['last_name']}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff262626),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_circle_outline,
                                              size: 15,
                                              color: Color(0xff1780C2),
                                            ),
                                            Text(
                                              " 20 уроков ",
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
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Icon(
                                                Icons.access_time,
                                                size: 15,
                                                color: Color(0xffF97316),
                                              ),
                                            ),
                                            Text(
                                              " 16 ч ",
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
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
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
                            width: 154,
                            height: 194,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "${user[5]['avatar']}",
                                    fit: BoxFit.cover,
                                    width: 156,
                                    height: 140,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 5),
                                      child: Text(
                                        "${user[1]['first_name']} ${user[5]['last_name']}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff262626),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_circle_outline,
                                              size: 15,
                                              color: Color(0xff1780C2),
                                            ),
                                            Text(
                                              " 20 уроков ",
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
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Icon(
                                                Icons.access_time,
                                                size: 15,
                                                color: Color(0xffF97316),
                                              ),
                                            ),
                                            Text(
                                              " 16 ч ",
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
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
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "${user[5]['avatar']}",
                                    fit: BoxFit.cover,
                                    width: 168,
                                    height: 140,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 5),
                                      child: Text(
                                        "${user[5]['first_name']} ${user[5]['last_name']}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff262626),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_circle_outline,
                                              size: 15,
                                              color: Color(0xff1780C2),
                                            ),
                                            Text(
                                              " 20 уроков ",
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
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Icon(
                                                Icons.access_time,
                                                size: 15,
                                                color: Color(0xffF97316),
                                              ),
                                            ),
                                            Text(
                                              " 16 ч ",
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
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
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
                            width: 154,
                            height: 194,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "${user[5]['avatar']}",
                                    fit: BoxFit.cover,
                                    width: 156,
                                    height: 140,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 5),
                                      child: Text(
                                        "${user[1]['first_name']} ${user[1]['last_name']}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff262626),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_circle_outline,
                                              size: 15,
                                              color: Color(0xff1780C2),
                                            ),
                                            Text(
                                              " 20 уроков ",
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
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Icon(
                                                Icons.access_time,
                                                size: 15,
                                                color: Color(0xffF97316),
                                              ),
                                            ),
                                            Text(
                                              " 16 ч ",
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
