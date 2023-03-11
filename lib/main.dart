import 'package:flutter/material.dart';
import 'package:kyo/request.dart';
import 'package:kyo/stt.dart';
import 'package:kyo/recorder.dart';
import 'package:speech_to_text/speech_to_text.dart' as sst;
import 'package:kyo/screens/Chat page/chat.dart';
import 'package:kyo/screens/Chat page/home_page.dart';
import 'package:kyo/screens/mail page/inbox.dart';
import 'package:kyo/screens/Auth page/auth.dart';

TextEditingController controller = TextEditingController();
String generatedText = '';
final recorder = Recorder();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(child: AuthPage()));
  }
}
