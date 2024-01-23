

import 'package:dart_openai/dart_openai.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAnswer {
  Future<Message> getAnswer(String text) async {
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "tu nombre es Branchito, debes saludar amablemente indicando tu nombre",
        ),
      ],
      role: OpenAIChatMessageRole.system,
    );

    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          text,
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

    print(chatCompletion.choices.first.message.toString());

    return Message(
      //message: response.data['answer'],
      message: chatCompletion.choices.first.message.toString(),
      //urlimage: response.data['image'],
      sender: FromWho.your,
    );
  }
}
