import 'package:flutter/material.dart';
import 'package:kyo/screens/Auth page/text_field.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F2F6),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/logo.png")),
          SizedBox(
            height: 60,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                "Sign in",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CustomTextField(),
          SizedBox(
            height: 20,
          ),
          CustomTextField(),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF62F53),
                  fixedSize: const Size(240, 70),
                  elevation: 10,
                  shadowColor: Color(0xFFF62F53),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    "Sign in",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Image.asset("assets/images/circle_arrow.png")
                ],
              )),
          SizedBox(
            height: 40,
          ),
          Text(
            "OR",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: const Size(240, 70),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset("assets/images/google_logo.png"),
                  SizedBox(width: 20),
                  Text(
                    "Login with google",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  text: 'Don\'t have an account ?',
                  children: [
                TextSpan(
                    text: '  Sign up',
                    style: TextStyle(color: Color(0xFFF62F53), fontSize: 18))
              ]))
        ],
      ),
    );
  }
}
