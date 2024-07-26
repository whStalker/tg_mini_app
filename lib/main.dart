import 'package:flutter/material.dart';
import 'package:telegram_web_app/telegram_web_app.dart';
import 'package:tg_mini_app/main_page.dart';

void main() async {
  await TelegramWebApp.instance.expand();
  await TelegramWebApp.instance.disableVerticalSwipes();
  await TelegramWebApp.instance.enableClosingConfirmation();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
