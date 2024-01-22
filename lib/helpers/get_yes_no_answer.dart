import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  final url = 'https://api.openai.com/v1/chat/completions';
  final headers = {
    'Content-Type':
        'application/json', // ajusta el tipo de contenido según tus necesidades
    'Authorization':
        'Bearer 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', // si es necesario enviar un token de autorización
  };
  Future<Message> getAnswer(String text) async {
    final bodyRequest = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content":
              "tu nombre es Branchito, debes saludar amablemente indicando tu nombre"
        },
        {"role": "user", "content": text}
      ]
    };

    try {
      final response = await _dio.post(
        url,
        data: jsonEncode(bodyRequest),
        options: Options(headers: headers),
      );
      print(response);
    } catch (error) {
      print('Error $error');
    }
    //final response = await _dio.get('https://yesno.wtf/api');

    return Message(
      //message: response.data['answer'],
      message: '...',
      //urlimage: response.data['image'],
      sender: FromWho.your,
    );
  }
}
