import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umar_azizov/papka/Zaregistirvni.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:umar_azizov/papka/otpravitnowkod.dart';
import 'package:umar_azizov/papka/ButtonNavigationBar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool chashmak = true, chashmak2 = true;
  var emailControl = TextEditingController(text: "eve.holt@reqres.in");
  var passworldControl = TextEditingController(text: "cityslicka");
  var SecuritiStore = FlutterSecureStorage();
  bool errorText = false;
  bool isLoading = false;
  String Email = "";
  String Passwold = "";
  String tocin = "";
  Color trueColor = Colors.grey;

  Future LoginMEtod(email, password) async {
    setState(() {
      isLoading = true;
    });
    var adres = await http.post(Uri.parse("https://reqres.in/api/login"),
        headers: <String, String>{
          'Content-Type': "application/json",
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }));
    if (adres.statusCode == 200) {
      var tokn = json.decode(adres.body)['token'];

      setState(() {
        tocin = tokn;
        trueColor = Colors.grey;
      });
      await SecuritiStore.write(key: "token", value: tokn);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    } else {
      setState(() {
        trueColor = Colors.red;
        errorText = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(
              child: SvgPicture.asset(
                "images/Logo (2).svg",
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: isLoading
              ? SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 100.0,
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        "images/image 134.png",
                      ),
                      SizedBox(height: 20),
                      const TabBar(
                        indicatorColor: Colors.blue,
                        labelColor: Colors.blue,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        unselectedLabelColor: Colors.black,
                        unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        tabs: [
                          Tab(text: "Телефон"),
                          Tab(text: "Email"),
                        ],
                      ),
                      SizedBox(
                        height: 240,
                        child: TabBarView(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      labelText: "Введите номер",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: TextField(
                                    obscureText: chashmak,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              chashmak = !chashmak;
                                            });
                                          },
                                          icon: chashmak
                                              ? Icon(Icons.visibility_sharp)
                                              : Icon(Icons.visibility_off_sharp),
                                        ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      labelText: "Пароль",
                                    ),
                                  ),
                                ),
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
                                    "Забыли пароль?",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: TextField(
                                    controller: emailControl,
                                    cursorColor: trueColor,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: trueColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      labelText: "Email",
                                      labelStyle: TextStyle(
                                        color: trueColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 5),
                                  child: TextField(
                                    controller: passworldControl,
                                    cursorColor: trueColor,
                                    obscureText: chashmak2,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            chashmak2 = !chashmak2;
                                          });
                                        },
                                        icon: chashmak2
                                            ? Icon(Icons.visibility_sharp)
                                            : Icon(Icons.visibility_off),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                          color: trueColor,
                                          style: BorderStyle.solid,
                                          width: 1,
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: trueColor,
                                      ),
                                      labelText: "Пароль",
                                    ),
                                  ),
                                ),
                                errorText
                                    ? Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          "Either your email or password is wrong",
                                          style: TextStyle(
                                            color: trueColor,
                                            fontSize: 10,
                                          ),
                                        ),
                                      )
                                    : Text(""),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Otpravitnowkod()));
                                  },
                                  child: const Text(
                                    "Забыли пароль?",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(MediaQuery.of(context).size.width * 0.9, 60),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {
                          LoginMEtod(emailControl.text, passworldControl.text);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            "Войти",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Нет аккаунта?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PasswordResetApp()));
                            },
                            child: const Text(
                              "Зарегистрироваться",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
