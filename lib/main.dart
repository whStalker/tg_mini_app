import 'package:flutter/material.dart';
import 'package:telegram_web_app/telegram_web_app.dart';
import 'package:tg_mini_app/main_page.dart';
import 'package:tg_mini_app/presentation/create_task_page.dart';
import 'package:tg_mini_app/presentation/project_info_page.dart';

void main() async {
  await TelegramWebApp.instance.ready();
  await TelegramWebApp.instance.disableVerticalSwipes();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      // ProjectInfoPage(),
      MainPage(),
    );
  }
}
