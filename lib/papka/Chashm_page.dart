import 'package:flutter/material.dart';
import 'package:umar_azizov/papka/ButtonNavigationBar.dart';

class ChashmPage extends StatefulWidget {
  const ChashmPage({super.key});

  @override
  State<ChashmPage> createState() => _ChashmPageState();
}

class _ChashmPageState extends State<ChashmPage> {
  int likes = 16;

  int dislikes = 2;

  void _incrementLikes() {
    setState(() {
      likes++;
    });
  }

  void _incrementDislikes() {
    setState(() {
      dislikes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Чашм",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(Icons.format_list_bulleted)
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            'Чашм',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Image.asset(
            'images/Anatomy.png',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  color: Color(0xff1780C2),
                ),
                onPressed: _incrementLikes,
              ),
              Text('$likes'),
              SizedBox(width: 8.0),
              IconButton(
                icon: Icon(
                  Icons.thumb_down,
                  color: Color(0xffDC2626),
                ),
                onPressed: _incrementDislikes,
              ),
              Text('$dislikes'),
              Spacer(),
              Icon(Icons.remove_red_eye),
              Text('25'),
            ],
          ),
          Text(
            'Чашм (лат. oculus) узви ҳисси (узви системаи визуалии) ҳайвонот буда, қобилияти дарк кардани радиатсияи электромагнитиро дар доираи дарозии мавҷҳои намоён дошта, вазифаи бинишро таъмин мекунад. Одам тақрибан 90% маълумотро аз олами атроф тавассути чашм қабул мекунад.Чашми ҳайвоноти устухон қисми канории анализатори визуалӣ мебошад, ки дар он вазифаи фоторесепторҳоро ҳуҷайраҳои нейросенсории (фоторецепторҳои) ретина иҷро мекунанд.Эволюцияи чашм Дар ҳайвонҳои беғамҳо чашмҳо ва оселлҳои намудҳои гуногуни сохтор ва қобилияти диданӣ мавҷуданд - якҳуҷайра ва бисёрҳуҷайра, рост ва чаппа (инверт), паренхималӣ ва эпителиалӣ, содда ва мураккаб.',
          ),
          SizedBox(height: 16.0),
          Text(
            'Эволюция чашм',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Дар ҳайвонҳои беғамҳо чашмҳо ва оселлҳои намудҳои гуногуни сохтор ва қобилияти диданӣ мавҷуданд - якҳуҷайра ва бисёрҳуҷайра, рост ва чаппа (инверт), паренхималӣ ва эпителиалӣ, содда ва мураккаб.',
          ),
          SizedBox(height: 16.0),
          Container(
            width: 328,
            height: 142,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF3F4F6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Комментарии (0)",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.forum_outlined,
                        size: 40,
                        color: Color(0xff94A3B8),
                      ),
                      Text(
                        "Пока комментариев нет!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff94A3B8),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  shadowColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(0),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffE2E8F0),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Color(0xff94A3B8),
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  shadowColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(0),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // SizedBox(width: double.infinity),
                          Container(
                            width: 32,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.close)),
                          ),
                          Image.asset("images/image 116.png"),
                          Text(
                            "Упс, ошибочка!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Оформите подписку, чтобы получить доступ к курсу ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff737373),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              elevation: MaterialStateProperty.all<double>(0),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(),
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 320,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff1780C2),
                              ),
                              child: Text(
                                "Офрмить",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 123,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xff1780C2),
                    border: Border.all(
                      color: Color(0xffE2E8F0),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Дальше",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Color(0xffffffff),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
