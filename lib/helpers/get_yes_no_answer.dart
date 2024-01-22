import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAnswer {
  /*final _dio = Dio();
  final url = 'https://api.openai.com/v1/chat/completions';
  final headers = {
    'Content-Type':
        'application/json', // ajusta el tipo de contenido según tus necesidades
    'Authorization':
        'Bearer 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', // si es necesario enviar un token de autorización
  };*/
  Future<Message> getAnswer(String text) async {
    /*final bodyRequest = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content":
              "tu nombre es Branchito, debes saludar amablemente indicando tu nombre"
        },
        {"role": "user", "content": text}
      ]
    };*/

   /* try {
      final response = await _dio.post(
        url,
        data: jsonEncode(bodyRequest),
        options: Options(headers: headers),
      );
      print(response);
    } catch (error) {
      print('Error $error');
    }*/
    //final response = await _dio.get('https://yesno.wtf/api');
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "return any message you are given as JSON.",
        ),
      ],
      role: OpenAIChatMessageRole.assistant,
    );

    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "Hello, I am a chatbot created by OpenAI. How are you today?",
        ),
      ],
      role: OpenAIChatMessageRole.user,
    );

    final requestMessages = [
      systemMessage,
      userMessage,
    ];

    final chatCompletion = await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo-0613",
      messages: requestMessages
      //prompt: text,
    );

    print(chatCompletion.choices.first.message);

    return Message(
      //message: response.data['answer'],
      message: '...',
      //urlimage: response.data['image'],
      sender: FromWho.your,
    );
  }
}
