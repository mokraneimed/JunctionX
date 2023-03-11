import 'package:flutter/material.dart';

class LandPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 270,
              child: Image.asset(
                "assets/images/Rectangle.png",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 35,
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 25,
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Imed Edddine Mokrane',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Student")
                    ],
                  ),
                  SizedBox(width: 40),
                  Image.asset("assets/images/go.png")
                ],
              ),
            ),
            Positioned(
                left: 85,
                bottom: 60,
                child: Image.asset("assets/images/logo.png"))
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Image.asset("assets/images/book.png"),
        SizedBox(
          height: 25,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF62F53),
                fixedSize: const Size(240, 70),
                elevation: 10,
                shadowColor: Color(0xFFF62F53),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Inbound Marketing",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.download)
              ],
            )),
      ],
    ));
  }
}
