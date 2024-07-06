import 'package:flutter/material.dart';
import 'package:umar_azizov/papka/home.dart';

class Home_Container_page extends StatelessWidget {
  const Home_Container_page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(41, 17, 24, 39),
            blurRadius: 5,
            offset: Offset(2, 4),
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
                  "images/Spine.png",
                  width: 80,
                  height: 80,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Сутунмухра",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff262626),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5),
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
                            padding:
                                const EdgeInsets.only(left: 3),
                            child: Icon(
                              Icons.access_time,
                              size: 15,
                              color: Color(0xffF97316),
                            ),
                          ),
                          Text(
                            " 16 ч ",
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
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xff1780C2)),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Пройдено: 6/20'),
                    Text(
                      '${(progress * 100).round()}%',
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
