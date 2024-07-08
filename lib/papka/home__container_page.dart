import 'package:flutter/material.dart';

class HomeContainerPage extends StatelessWidget {
  final String image;
  final String name;
  final int duration;
  final int lessons;
  final double proy;

  const HomeContainerPage({
    super.key,
    required this.image,
    required this.name,
    required this.duration,
    required this.lessons,
    required this.proy,
  });

  String formatProy(double value) {
    int numerator = (value * 10).round();
    int denominator = 10;
    return '$numerator/$denominator';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(36, 17, 24, 39),
            blurRadius: 8,
            offset: Offset(3, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      width: 250,
      height: 136,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  width: 80,
                  height: 80,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff262626),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_circle_outline,
                            size: 15,
                            color: Color(0xff1780C2),
                          ),
                          Text(
                            " ${duration} уроков ",
                            style: TextStyle(
                              fontSize: 12,
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
                            '${lessons} ч',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff737373),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Подписка: ",
                          style: TextStyle(
                              color: Color(0xff525252),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "20 дней",
                          style: TextStyle(
                              color: Color(0xff22C55E),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(8),
                  value: proy,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff1780C2)),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Пройдено: ${formatProy(proy)}'),
                    Text(
                      '${(proy * 100).round()}%',
                      style: TextStyle(
                        color: Color(0xff1780C2),
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
