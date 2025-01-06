import 'package:chat_app/core/message_page.dart';
import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: MessagePage(),
    );
  }
}
