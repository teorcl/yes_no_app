import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/env/env.dart';
import 'package:yes_no_app/presentation/chat/chat_page.dart';
import 'package:yes_no_app/presentation/provider/chat_provider.dart';
import 'package:yes_no_app/theme/app_theme.dart';
import 'package:dart_openai/dart_openai.dart';



void main() {
  OpenAI.apiKey = Env.apiKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yes No App',
        theme: AppTheme(indexColorSelected: 5).theme(),
        home: const ChatPage(),
      ),
    );
  }
}
