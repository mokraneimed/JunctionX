import 'package:kyo/screens/mail page/mail.dart';
import 'package:flutter/material.dart';
import 'package:kyo/screens/mail page/generating_page.dart';

class Inbox extends StatefulWidget {
  @override
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _Inbox();
}

class _Inbox extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 80,
            child: Center(
                child: Text(
              "Voice GPT",
              style: TextStyle(fontSize: 24),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: [
              Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "abv@gmail.com",
                      prefixIcon: Image.asset("assets/images/Mail.png"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              SizedBox(
                  width:
                      45), // add some spacing between the text field and button
              Material(
                elevation: 10,
                shadowColor: Color(0xFFF62F53),
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 28,
                  child: Icon(Icons.search),
                  backgroundColor: Color(0xFFF62F53),
                  foregroundColor: Colors.white,
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Inbox",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, index) {
                  return (index == 0)
                      ? SizedBox(
                          height: 20,
                        )
                      : GestureDetector(onTap: () {}, child: Mail());
                }),
          ),
        ],
      ),
    );
  }
}
