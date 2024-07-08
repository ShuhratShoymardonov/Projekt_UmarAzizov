import 'package:flutter/material.dart';
import 'package:umar_azizov/papka/Data_kourse.dart';

class Home_Container3_page extends StatelessWidget {
  final String image;
  final String name;
  final String urok;
  final String chas;
  const Home_Container3_page({
    super.key,
    required this.image,
    required this.name,
    required this.urok,
    required this.chas,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(61, 17, 24, 39),
            blurRadius: 3,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DataKourse(),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                image,
                width: 158,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff262626),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.play_circle_outline,
                        size: 15,
                        color: Color(0xff1780C2),
                      ),
                      Text(
                        " ${urok} уроков ",
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
                        " ${chas} ",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff737373),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
