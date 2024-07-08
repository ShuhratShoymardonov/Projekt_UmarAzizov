import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Chat1 extends StatefulWidget {
  const Chat1({super.key});

  @override
  _Chat1State createState() => _Chat1State();
}

class _Chat1State extends State<Chat1> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];
  // bool _isWriting = true;

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: Image.asset(
                "images/UmarAzizov.png",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Column(
                children: [
                  Text(
                    "Умар Азизов",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Row(
                      children: [
                        Image.asset("images/Dot.png"),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "Online",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      child: Text(
                        _messages[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 219, 219, 219),
                suffixIcon: IconButton(
                  onPressed: _sendMessage,
                  icon: 
                  // _isWriting
                  //     ?
                       Icon(
                          Icons.send_rounded,
                          size: 35,
                          color: Colors.blue,
                        )
                      // : IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.image_outlined),
                      //   ),
                ),
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.sentiment_satisfied_outlined,
                    size: 30,
                    color: Color(0xff64748B),
                  ),
                ),
                hintText: " Message",
                hintStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
