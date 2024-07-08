import 'package:flutter/material.dart';
import 'package:umar_azizov/papka/chat1.dart';

class Konsuk extends StatelessWidget {
  const Konsuk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Онлайн-консультация',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 22.0),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 30,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        child: Image.asset(
                          "images/Frame 1261155011.png",
                        ),
                      ),
                      Positioned(
                        bottom: -70,
                        left: MediaQuery.of(context).size.width / 4,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                  "images/UmarAzizov.png",
                                ),
                                fit: BoxFit.cover),
                            border: Border.all(color: Colors.white, width: 8),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 70),
              Image.asset("images/Logo (3).png"),
              Text(
                "Руководитель клиники EuroMed в Душанбе",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 84,
                decoration: BoxDecoration(
                  color: Color(0xffF4F4F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Количество",
                        style: TextStyle(
                          color: Color(0xff525252),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "консультаций: 3",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          fontFamily: "Helvetica ",
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 150),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 72,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(36, 17, 24, 39),
                      blurRadius: 10,
                      offset: Offset(4, 4),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Цена",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xff94A3B8),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "60 сомони",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat1(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            "Купить",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
