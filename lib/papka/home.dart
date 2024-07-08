import 'home_drawer.dart';
import 'home_text_moykurs.dart';
import 'home__reklama_page.dart';
import 'home__container_page.dart';
import 'home__container3_page.dart';
import 'home__container2_page.dart';
import 'package:flutter/material.dart';
import 'package:umar_azizov/papka/kurs.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umar_azizov/papka/Uvedomilni_Page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

bool font = true;

Color get teme1 => font ? Color.fromARGB(255, 44, 46, 66) : Colors.blue;
Color get teme2 => font ? Color.fromARGB(255, 43, 60, 95) : Colors.white;
Color get textColor => font ? Colors.black : Colors.white;

double vertikal = 11;

double progress = 10 / 20;

int activeindex = 0;

final List<String> imageUrls = [
  'images/Frame 1261154925.jpg',
];

final List<Map<String, dynamic>> item1 = [
  {
    'id': '1',
    'image': "images/Anatomy.png",
    'title': 'Анатомия',
    'duration': 34,
    'lessons': 20,
    'proy': 0.8,
  },
  {
    'id': '2',
    'image': "images/Breath 1.png",
    'title': 'Шиши нав',
    'lessons': 14,
    'duration': 27,
    'proy': 0.3,
  },
  {
    'id': '3',
    'image': "images/Spine (1).png",
    'title': 'Шиш',
    'lessons': 13,
    'duration': 17,
    'proy': 0.5,
  },
  {
    'id': '4',
    'image': "images/Anatomy.png",
    'title': 'Анатомия',
    'lessons': 18,
    'duration': 15,
    'proy': 0.2,
  },
];
final List<Map<String, dynamic>> courses = [
  {
    'id': '1',
    'title': 'Анатомия',
    'lessons': '20 ',
    'duration': '34 ч',
    'image': "images/Anatomy.png",
  },
  {
    'id': '2',
    'title': 'Шиши нав',
    'lessons': '14 ',
    'duration': '27 ч',
    'image': "images/Breath 1.png",
  },
  {
    'id': '3',
    'title': 'Шиш',
    'lessons': '23 ',
    'duration': '39 ч',
    'image': "images/Breath 1.png",
  },
  {
    'id': '4',
    'title': 'Сутунмухра',
    'lessons': '13 ',
    'duration': '21 ч',
    'image': "images/Spine (1).png",
  },
  {
    'id': '5',
    'title': 'Анатомия',
    'lessons': '20 ',
    'duration': '34 ч',
    'image': "images/Anatomy.png",
  },
  {
    'id': '6',
    'title': 'Шиши нав',
    'lessons': '14 ',
    'duration': '27 ч',
    'image': "images/Breath 1.png",
  },
  {
    'id': '7',
    'title': 'Шиш',
    'lessons': '23 ',
    'duration': '39 ч',
    'image': "images/Breath 1.png",
  },
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: SvgPicture.asset(
                  "images/Logo (2).svg",
                ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Uvedomilno(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        drawer: HomeDrawer(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Home_Reklama_page(),
            ),
            SliverToBoxAdapter(
              child: HomeTextMoykurs(),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(item1.length, (index) {
                    return HomeContainerPage(
                      image: item1[index]['image'],
                      duration: item1[index]['duration'],
                      name: item1[index]['title'],
                      proy: item1[index]['proy'],
                      lessons: item1[index]['lessons'],
                    );
                  }),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Популярное",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: List.generate(courses.length, (index) {
                      return Home_Container2_page(
                        image: courses[index]['image'],
                        name: courses[index]['title'],
                        duration: courses[index]['duration'],
                        lessons: courses[index]['lessons'],
                      );
                    }),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
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
                            builder: (context) => Kurs(),
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
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 0.84,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Home_Container3_page(
                    image: courses[index]['image'],
                    name: courses[index]['title'],
                    chas: courses[index]['duration'],
                    urok: courses[index]['lessons'],
                  );
                },
                childCount: courses.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
