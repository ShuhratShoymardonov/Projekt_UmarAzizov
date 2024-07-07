import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:umar_azizov/papka/Koshelok.dart';
import 'package:umar_azizov/papka/moy_dengi.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:umar_azizov/papka/Uvedomilni_Page.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
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

  bool chashmm1 = true;
  bool chashmm2 = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffF3F4F6),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Профиль",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none_outlined),
                color: Colors.blue,
              ),
            ],
          ),
        ),
        body: user.isEmpty
            ? SpinKitFadingCircle(
                color: Colors.blue,
                size: 100.0,
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        color: Color(0xffF3F4F6),
                      ),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                left: 20,
                                top: 16,
                                right: 16,
                              ),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFCBD5E1),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage("${user[1]['avatar']}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Center(
                                child: user.isEmpty
                                    ? Text(
                                        "CA",
                                        style: TextStyle(
                                          color: Color(0xff64748B),
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : Text(""),
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${user[1]['first_name']} ${user[1]['last_name']}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 0),
                                Text(
                                  "${user[1]['email']}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff525252),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 158,
                                height: 108,
                                decoration: BoxDecoration(
                                  color: Color(0xffF3F4F6),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Color(0xff1780C2),
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.layers,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Мои курсы",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 158,
                                height: 108,
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  color: Color(0xffF3F4F6),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width *
                                            0.90,
                                        60),
                                    backgroundColor: Color(0xffF3F4F6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Koshelok(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 140),
                                        Container(
                                          width: 83,
                                          height: 36,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Color(0xff1780C2),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons
                                                    .account_balance_wallet_outlined,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              Text(
                                                "950 c",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "Кошелек",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff262626),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Container(
                            width: 328,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.95,
                                    60),
                                backgroundColor: Color(0xffF3F4F6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MoyDengi(),
                                    ));
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person_outline_outlined,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 110),
                                    child: Text(
                                      "Мои данные",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Color(0xffA3A3A3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 24),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Настройки",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 328,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.95,
                                    60),
                                backgroundColor: Color(0xffF3F4F6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) => Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.75,
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      children: [
                                        SizedBox(width: double.infinity),
                                        Container(
                                          width: 32,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        // SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Сменить пароль",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.close),
                                            ),
                                          ],
                                        ),
                                        Image.asset("images/image 131.png"),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 8),
                                          child: TextField(
                                            obscureText: chashmm2,
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    chashmm2 = !chashmm2;
                                                  });
                                                },
                                                icon: chashmm2
                                                    ? Icon(Icons.visibility)
                                                    : Icon(
                                                        Icons.visibility_off),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              labelText: "Старый пароль",
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 8),
                                          child: TextField(
                                            obscureText: chashmm1,
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    chashmm1 = !chashmm1;
                                                  });
                                                },
                                                icon: chashmm1
                                                    ? Icon(Icons.visibility)
                                                    : Icon(
                                                        Icons.visibility_off),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              labelText: "Новый пароль",
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 8),
                                          child: TextField(
                                            obscureText: chashmm2,
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    chashmm2 = !chashmm2;
                                                  });
                                                },
                                                icon: chashmm2
                                                    ? Icon(Icons.visibility)
                                                    : Icon(
                                                        Icons.visibility_off),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              labelText: "Повторите пароль",
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.95,
                                                60),
                                            backgroundColor: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: const Text(
                                              "Офрмить подписку",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.lock_outline_rounded,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 80),
                                    child: Text(
                                      "Сменить пароль",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Color(0xffA3A3A3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 328,
                            height: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.95,
                                    60),
                                backgroundColor: Color(0xffF3F4F6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Uvedomilno(),
                                    ));
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.notifications_none,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 75,
                                    ),
                                    child: Text(
                                      "Уведомления",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Image.asset("images/Caption & Icon.png"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 28),
                          Container(
                            width: 328,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.95,
                                    60),
                                backgroundColor: Color(0xffF3F4F6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Center(
                                    child: Container(
                                      width: 312,
                                      height: 116,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xffFFFFFF),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Вы действительно хотите выйти?",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  SystemNavigator.pop();
                                                },
                                                child: Text(
                                                  "Да, выйти",
                                                  style: TextStyle(
                                                    color: Color(0xffEF4444),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  "Отмена",
                                                  style: TextStyle(
                                                    color: Color(0xff1780C2),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.exit_to_app,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 155),
                                    child: Text(
                                      "Выйти",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Color(0xffA3A3A3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
