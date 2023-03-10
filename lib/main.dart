import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kyo/request.dart';
import 'package:kyo/stt.dart';
import 'package:kyo/recorder.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String speech = '';
  @override
  void initState() {
    super.initState();

    recorder.initRecorder();
  }

  @override
  void dispose() {
    recorder.recorder.closeRecorder();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          ElevatedButton(onPressed: toggleRecording, child: Icon(Icons.mic)),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter your prompt',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final prompt = controller.text;
              final text = await sendRequest(speech);
              setState(() {
                generatedText = text;
              });
            },
            child: Text('Generate'),
          ),
          SizedBox(height: 20),
          Text(
            speech,
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

  Future toggleRecording() async {
    SpeechApi.toggleRecording(
      onResult: (speech) => setState(() => this.speech = speech),
    );
  }
}
