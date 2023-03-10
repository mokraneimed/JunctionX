import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as sst;

class ChatPage extends StatefulWidget {
  @override
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  String speech = '';
  late sst.SpeechToText _speech;
  bool isListening = false;
  String textSpeech = "c mon man";
  List prompts = ["uregfe"];
  List responses = [];

  void onListen() async {
    bool available = await _speech.initialize(
        onStatus: (val) => print('on status $val'),
        onError: (val) => print("on error $val"));
    if (available) {
      setState(() {
        isListening = true;
      });
      _speech.listen(
          onResult: (val) => setState(() {
                textSpeech = val.recognizedWords;
              }));
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
        floatingActionButton: FloatingActionButton(onPressed: onListen),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        body: Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: List.generate(
                  prompts.length,
                  (index) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 30),
                        color: Colors.red,
                        width: 80,
                        child: Text(prompts[index]),
                      ),
                    );
                  },
                ).toList(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  color: Colors.red,
                  width: 80,
                  child: Text(textSpeech),
                ),
              )
            ],
          ),
        ));
  }
}
