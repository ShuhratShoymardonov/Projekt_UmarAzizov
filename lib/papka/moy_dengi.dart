import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MoyDengi extends StatefulWidget {
  const MoyDengi({super.key});

  @override
  State<MoyDengi> createState() => _MoyDengiState();
}

class _MoyDengiState extends State<MoyDengi> {
  List user = [];
  var emailControl = TextEditingController(text: "janet.weave@reqres.in");
  var nameControl = TextEditingController(text: "Janet");
  var lastnameControl = TextEditingController(text: "Weaver");
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
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: .0),
          child: Text(
            "Мои данные",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
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
            Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xffCBD5E1),
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
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  right: 130,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: TextField(
                      controller: nameControl,
                      scrollPadding: EdgeInsets.all(16),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                        labelText: "Имя",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: TextField(
                      controller: lastnameControl,
                      scrollPadding: EdgeInsets.all(16),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                        labelText: "Фамилия",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: TextField(
                      scrollPadding: EdgeInsets.all(16),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                        labelText: "Введите номер",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: TextField(
                      controller: emailControl,
                      scrollPadding: EdgeInsets.all(16),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        labelText: "Email",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: TextField(
                      scrollPadding: EdgeInsets.all(16),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                        labelText: "Город",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: TextField(
                      scrollPadding: EdgeInsets.all(16),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                        labelText: "ДД.ММ.ГГГГ",
                        suffixIcon: Icon(Icons.event),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 328,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.95, 60),
                        backgroundColor: Color(0xffE2E8F0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Сохранить",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff94A3B8)),
                      ),
                    ),
                  ),
                  SizedBox(height: 200),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
