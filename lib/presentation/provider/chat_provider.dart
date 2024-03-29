import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(message: 'Hola', sender: FromWho.me),
    Message(message: 'Ya estás en casa?', sender: FromWho.me),
  ];

  Future<void> sendMenssage({required String textMessage}) async {
    if (textMessage.isEmpty) {
      return;
    }

    final newMessage = Message(message: textMessage, sender: FromWho.me);

    yourReply(newMessage.message);

    messageList.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> yourReply(String text) async {
    final yourMessage = await getYesNoAnswer.getAnswer(text);
    messageList.add(yourMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn);
  }
}
