import 'package:flutter/material.dart';
import 'package:umar_azizov/papka/home.dart';

class Drawer_Container extends StatelessWidget {
  final String name;
  final IconData icon;
  const Drawer_Container({
    super.key,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.blue,
      autofocus: EditableText.debugDeterministicCursor,
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: vertikal),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: textColor,
            ),
            Text(
              "   $name",
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
