import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:umar_azizov/papka/loginPhon1.dart';
import 'package:umar_azizov/papka/otpravitnowkod.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class Zabil extends StatefulWidget {
  @override
  _ZabilState createState() => _ZabilState();
}

class _ZabilState extends State<Zabil> {
  bool chashmm1 = true;
  bool chashmm2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
        title: Text(
          "Сброс пароля",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset(
                  'images/image 122.png',
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Text(
                      "Введите код отправленный на почту",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "example@mail.ru",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Otpravitnowkod(),
                      ),
                    );
                  },
                  child: const Text(
                    "Отправить новый код",
                    style: TextStyle(
                      color: Color(0xff1780C2),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffE2E8F0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffA3A3A3),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      labelText: "Введите код",
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffA3A3A3),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Придумайте новый пароль",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                            ? Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff737373),
                              )
                            : Icon(
                                Icons.visibility_off_outlined,
                                color: Color(0xff737373),
                              ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffE2E8F0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffA3A3A3),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      labelText: "Новый пароль",
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffA3A3A3),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    obscureText: chashmm2,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            chashmm2 = !chashmm2;
                          });
                        },
                        icon: chashmm1
                            ? Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff737373),
                              )
                            : Icon(
                                Icons.visibility_off_outlined,
                                color: Color(0xff737373),
                              ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffE2E8F0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffA3A3A3),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      labelText: "Повторите пароль",
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffA3A3A3),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.90, 60),
                    backgroundColor: Color(0xff1780C2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Подтвердить",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
