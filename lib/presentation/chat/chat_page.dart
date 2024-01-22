import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/chat/widgets/avatar.dart';
import 'package:yes_no_app/presentation/chat/widgets/my_message_bubble.dart';
import 'package:yes_no_app/presentation/chat/widgets/shared/message_field_box.dart';
import 'package:yes_no_app/presentation/chat/widgets/your_message_bubble.dart';
import 'package:yes_no_app/presentation/provider/chat_provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User X'),
        centerTitle: false,
        leading: const Avatar(
            'https://i.pinimg.com/736x/94/a0/f2/94a0f2e181cb03f4b532877b65b5c534.jpg'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.sender == FromWho.your) 
                    ? const YourMessageBubble() 
                    : MyMessageBubble(message: message,);
                },
              ),
            ),
            /// Ingreso del texto 
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMenssage(textMessage: value),
            ),
          ],
        ),
      ),
    );
  }
}
