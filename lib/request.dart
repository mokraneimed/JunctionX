import 'dart:convert';

import 'package:http/http.dart' as http;

final String apiUrl = "https://api.openai.com/v1/chat/completions";
final String apiKey = "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";

Future<String> sendRequest(String prompt) async {
  final response = await http.post(Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": '$prompt'}
        ],
      }));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final String text = data['choices'][0]['message']['content'];
    print(text);
    return text;
  } else {
    throw Exception('Failed to send request');
  }
}
