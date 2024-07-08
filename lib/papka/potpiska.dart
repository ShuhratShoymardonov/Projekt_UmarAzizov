import 'potpiska_continer_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:umar_azizov/papka/oplata.dart';

class Potpiska extends StatelessWidget {
  Potpiska({super.key});

  final List<Map<String, dynamic>> subscriptions = [
    {
      'title': 'Консультация',
      'price': '60 сом',
      'description': '3 консультации с врачом',
      'backgroundColor': Color(0xffE0F2FF),
      'titleColor': Color(0xff0288D1),
      'imagePath': 'images/Pattern.png',
      'additionalContent': null,
    },
    {
      'title': 'Подписка 1',
      'price': '850 сом/мес',
      'description': 'Просмотр курсов и его содержимого',
      'backgroundColor': Color(0xffF3E8FF),
      'titleColor': Color(0xff9333EA),
      'imagePath': 'images/Pattern (1).png',
      'additionalContent': null,
    },
    {
      'title': 'Подписка 2',
      'price': '800 сом/мес',
      'description': 'Доступ к курсу со скидкой',
      'backgroundColor': Color(0xffFFEDD5),
      'titleColor': Color(0xffEA580C),
      'imagePath': 'images/Pattern (2).png',
      'additionalContent': Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 20,
            left: 40,
            child: Image.asset("images/Frame 514481.png"),
          ),
          Positioned(
            top: 60,
            left: -40,
            child: Text(
              "880 сом/мес",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff525252),
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              color: Colors.red,
              child: Text(
                '5%',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Подписки",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        body: ListView(
          children: subscriptions.map((subscription) {
            return SubscriptionContainer(
              title: subscription['title'],
              price: subscription['price'],
              description: subscription['description'],
              backgroundColor: subscription['backgroundColor'],
              titleColor: subscription['titleColor'],
              imagePath: subscription['imagePath'],
              additionalContent: subscription['additionalContent'],
            );
          }).toList(),
        ),
      ),
    );
  }
}
