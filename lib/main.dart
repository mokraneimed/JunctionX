import 'package:flutter/material.dart';
import 'package:kyo/request.dart';
import 'package:flutter_sound/flutter_sound.dart';

TextEditingController controller = TextEditingController();
String generatedText = '';
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
  final recorder = FlutterSoundRecorder();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter your prompt',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final prompt = controller.text;
              final text = await sendRequest(prompt);
              setState(() {
                generatedText = text;
              });
            },
            child: Text('Generate'),
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
