import 'package:flutter/material.dart';
import 'package:umar_azizov/papka/MoyKurs.dart';

class HomeTextMoykurs extends StatelessWidget {
  const HomeTextMoykurs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Мои курсы",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MoyKurs(),
                ),
              );
            },
            child: Text(
              "Смотреть все >",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff1780C2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
