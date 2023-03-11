import 'package:flutter/material.dart';
import 'package:kyo/request.dart';
import 'package:kyo/stt.dart';
import 'package:kyo/recorder.dart';
import 'package:speech_to_text/speech_to_text.dart' as sst;
import 'package:kyo/screens/Chat page/chat.dart';
import 'package:kyo/screens/Chat page/home_page.dart';
import 'package:kyo/screens/mail page/inbox.dart';

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
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(
          child: HomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String speech = '';
  late sst.SpeechToText _speech;
  bool isListening = false;
  String textSpeech = "c mon man";

  void onListen() async {
    if (!isListening) {
      bool available = await _speech.initialize(
          onStatus: (val) => print('on status $val'),
          onError: (val) => print("on error $val"));
      if (available) {
        setState(() {
          isListening = true;
        });
        _speech.listen(
            listenFor: Duration(minutes: 10),
            onResult: (val) => setState(() {
                  textSpeech = val.recognizedWords;
                }));
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _speech = sst.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: onListen,
              child: (_speech.isListening) ? Icon(Icons.mic) : Icon(Icons.abc)),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter your prompt',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final prompt = controller.text;
            },
            child: Text('Generate'),
          ),
          SizedBox(height: 20),
          Text(
            textSpeech,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 20),
          Text(
            generatedText,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
