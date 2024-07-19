import 'package:flutter/material.dart';
import 'package:umar_azizov/papka/home.dart';
import 'package:umar_azizov/papka/kurs.dart';
import 'package:umar_azizov/papka/profil.dart';
import 'package:umar_azizov/papka/potpiska.dart';
import 'package:umar_azizov/papka/konsultatsia.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  List<Widget> sahifaho = [
    Home(),
    Potpiska(),
    Kurs(),
    Konsuk(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sahifaho[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: selectPage,
        fixedColor: Color(0xff1780C2),
        unselectedItemColor: Color(0xff737373),
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            label: "Подписки",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers_outlined),
            label: "Курсы",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_outlined),
            label: "Консультация",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: "Профиль",
          ),
        ],
      ),
    );
  }
}
