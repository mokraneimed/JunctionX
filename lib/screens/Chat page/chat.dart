import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as sst;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:kyo/request.dart';

final dataService = DataService();

class ChatPage extends StatefulWidget {
  @override
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  String generatedText = '';
  late sst.SpeechToText _speech;
  bool isListening = false;
  String textSpeech = "c mon man";
  List prompts = [];
  List responses = [];
  bool isLoading = false;

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
        body: Container(
      height: 690,
      child: Column(
        children: [
          Container(
            height: 80,
            child: Center(
                child: Text(
              "Voice GPT",
              style: TextStyle(fontSize: 24),
            )),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (BuildContext context, index) {
                  return (index != prompts.length)
                      ? Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 10, 25),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: Color(0xFFF62F53),
                                    borderRadius: BorderRadius.circular(20)),
                                width: 300,
                                child: Text(
                                  prompts[index],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 25),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 1, color: Color(0xFFDADADA))),
                                width: 300,
                                child: Text(
                                  responses[index],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            )
                          ],
                        )
                      : Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 25),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Color(0xFFF62F53),
                                borderRadius: BorderRadius.circular(20)),
                            width: 300,
                            child: Text(
                              textSpeech,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        );
                },
                separatorBuilder: (BuildContext context, index) {
                  return SizedBox(
                    height: 0,
                  );
                },
                itemCount: prompts.length + 1),
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
              ),
              GestureDetector(
                onTap: () async {
                  prompts.add(textSpeech);
                  final text = await dataService.sendRequest(textSpeech);
                  textSpeech = 'basics of dart';
                  setState(() {
                    generatedText = text;
                    responses.add(text);
                  });
                },
                child: Material(
                  elevation: 10.0,
                  shadowColor: Color(0xFFF62F53),
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                    radius: 30.0,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: onListen,
                child: AvatarGlow(
                  glowColor: Color(0xFFF62F53),
                  animate: _speech.isListening,
                  endRadius: 60.0,
                  child: Material(
                    elevation: 8.0,
                    shadowColor: Color(0xFFF62F53),
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "assets/images/mic.png",
                        height: 24,
                        width: 24,
                      ),
                      radius: 30.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
