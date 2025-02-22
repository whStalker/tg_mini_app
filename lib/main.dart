import 'package:flutter/material.dart';
import 'package:telegram_web_app/telegram_web_app.dart';
import 'package:tg_mini_app/main_page.dart';
import 'package:tg_mini_app/presentation/add_member_page.dart';
import 'package:tg_mini_app/presentation/create_project_page.dart';
import 'package:tg_mini_app/presentation/create_task_page.dart';
import 'package:tg_mini_app/presentation/project_info_page.dart';
import 'package:tg_mini_app/presentation/task_info_page.dart';
import 'package:tg_mini_app/presentation/user_tasks_page.dart';

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
      home:
          // UserTasksPage(),
          // CreateProjectPage(),
      // TaskInfoPage(),
      // CreateTaskPage(),
      // AddMemberPage(),
      // ProjectInfoPage(),
      MainPage(),
    );
  }
}
