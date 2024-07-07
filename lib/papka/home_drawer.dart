import 'package:flutter/material.dart';
import 'package:umar_azizov/papka/drawer__container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  bool font = false;

  Color get textColor =>
      font ? Color.fromARGB(255, 255, 255, 255) : Colors.black;
  Color get teme1 => font ? Color.fromARGB(255, 44, 46, 66) : Colors.blue;
  Color get teme2 => font ? Color.fromARGB(255, 43, 60, 95) : Colors.white;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: teme1,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                backgroundImage:
                                    AssetImage("images/UmarAzizov.png"),
                                radius: 30,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    font = !font;
                                  });
                                },
                                icon: font
                                    ? Icon(Icons.sunny, color: Colors.white)
                                    : Icon(
                                        Icons.nightlight_outlined,
                                        color: const Color.fromARGB(
                                            255, 12, 25, 48),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Umar azizov",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "+992 001778373",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          children: [
                            Container(
                              color: teme2,
                              child: ListTile(
                                minTileHeight: 8,
                                splashColor: Colors.blue,
                                title: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundImage: AssetImage(
                                              "images/UmarAzizov.png"),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "   Umar Azizov",
                                      style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                            Container(
                              color: teme2,
                              padding: EdgeInsets.only(bottom: 10),
                              child: ListTile(
                                minTileHeight: 10,
                                splashColor: Colors.blue,
                                title: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: textColor,
                                    ),
                                    Text(
                                      "     Add Account",
                                      style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                          collapsedBackgroundColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          collapsedShape: RoundedRectangleBorder(
                            side: BorderSide.none,
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                          ),
                          iconColor: Colors.white,
                          collapsedIconColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Ink(
                      decoration: BoxDecoration(
                        color: teme2,
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            splashColor: Colors.blue,
                            autofocus: EditableText.debugDeterministicCursor,
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Colors.black),
                                  bottom: BorderSide(color: Colors.black),
                                ),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    MdiIcons.accountCircleOutline,
                                    color: textColor,
                                  ),
                                  Text(
                                    "   My Profil",
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Drawer_Container(
                            icon: Icons.group_outlined,
                            name: 'My Profil',
                            textColor: textColor,
                          ),
                          Drawer_Container(
                            textColor: textColor,
                            icon: Icons.person_outline,
                            name: 'Contacts',
                          ),
                          Drawer_Container(
                            textColor: textColor,
                            icon: Icons.call_outlined,
                            name: 'Calls',
                          ),
                          Drawer_Container(
                            textColor: textColor,
                            icon: FontAwesomeIcons.streetView,
                            name: 'People Nearby',
                          ),
                          Drawer_Container(
                            textColor: textColor,
                            icon: Icons.bookmark_border,
                            name: 'Saved Messages',
                          ),
                          Drawer_Container(
                            textColor: textColor,
                            icon: Icons.settings_outlined,
                            name: 'Settings',
                          ),
                          Drawer_Container(
                            textColor: textColor,
                            icon: Icons.person_add_alt_outlined,
                            name: 'Invite Ffriends',
                          ),
                          Drawer_Container(
                            textColor: textColor,
                            icon: Icons.help_outline,
                            name: 'Telegram Features',
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
