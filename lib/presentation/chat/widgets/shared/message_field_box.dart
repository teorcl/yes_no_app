import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({
    super.key,
    required this.onValue,
  });

  final ValueChanged<String> onValue; // Este man devuelve lo que se escribe en el textField y donde llame este widget (MessageFieldBox)
  // uso ese valor según la necesidad

  @override
  Widget build(BuildContext context) {
    final textcontroller = TextEditingController();
    final focusNode = FocusNode();
    //final chatProvider = context.watch<
    //ChatProvider>(); //Mala practica me amarra el widget a ese priver solamente

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(30),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Your text, that you want to show',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      fillColor: Colors.grey,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textcontroller.value.text;
          //chatProvider.sendMenssage(textMessage: textValue);
          onValue(textValue);
          textcontroller.clear();
        },
        icon: const Icon(Icons.send),
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      decoration: inputDecoration,
      controller: textcontroller,
      onFieldSubmitted: (value) {
        onValue(value);
        textcontroller.clear();
        focusNode.requestFocus();
      },
      /* onChanged: (value) {
        print(value);
      }, */
    );
  }
}
