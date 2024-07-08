import 'package:flutter/material.dart';
import 'package:umar_azizov/papka/oplata.dart';

class SubscriptionContainer extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final Color backgroundColor;
  final Color titleColor;
  final String imagePath;
  final Widget? additionalContent;

  const SubscriptionContainer({
    Key? key,
    required this.title,
    required this.price,
    required this.description,
    required this.backgroundColor,
    required this.titleColor,
    required this.imagePath,
    this.additionalContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: titleColor,
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          description,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(imagePath),
              ],
            ),
            Container(
              width: 296,
              height: 48,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Oplata(),
                    ),
                  );
                },
                child: Text(
                  "Выбрать",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
