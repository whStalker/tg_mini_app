// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tg_mini_app/constant/colors_const.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

int value = 0;
bool positive = false;

class _CreateProjectPageState extends State<CreateProjectPage> {
  final TextEditingController _projectTitleController = TextEditingController();
  final TextEditingController _projectDescriptionController =
      TextEditingController();

  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  @override
  void dispose() {
    // Освобождаем ресурсы после использования
    _projectTitleController.dispose();
    _projectDescriptionController.dispose();
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  Future<void> createProject(
      String projectTitle, String projectDescription) async {
    // Показываем диалог загрузки
    showDialog(
      context: context,
      barrierDismissible: false, // Запрещаем закрытие диалога
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    final url = Uri.parse('http://localhost:8000/api/v1/project/');

    final header = {
      "Content-Type": "application/json",
      "X-User":
          "query_id=AAGidl0XAAAAAKJ2XRc_c0l3&user=%7B%22id%22%3A392001186%2C%22first_name%22%3A%22%24%24%24%24%24%24%24%24%22%2C%22last_name%22%3A%22%22%2C%22username%22%3A%22Wicked_Heaven%22%2C%22language_code%22%3A%22ru%22%2C%22allows_write_to_pm%22%3Atrue%2C%22photo_url%22%3A%22https%3A%5C%2F%5C%2Ft.me%5C%2Fi%5C%2Fuserpic%5C%2F320%5C%2FhFUFITh51vMU1fnse245ZpoMiiPxSttywVgHmfvToIM.svg%22%7D&auth_date=1731945334&signature=Bkvjr3IG-K0_2xGiQdPqRdqXkGrvIP1lTi2QqnZGJtiORn7jWHf5eVECRmcNXFMsZoAhWNIGt2Pe8qK04tEcAw&hash=141298c2c9e7ed7aefc143afebf80ac444448ce17687da648c29458615743a78",
    };

    final body = jsonEncode({
      "name": projectTitle,
      "description": projectDescription,
      "is_public": true,
    });

    try {
      final response = await http.post(
        url,
        headers: header,
        body: body,
      );

      Navigator.pop(context); // Закрываем диалог загрузки

      if (response.statusCode == 201) {
        debugPrint('Project created successfully');
        _projectTitleController.clear();
        _projectDescriptionController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Project created successfully')),
        );
      } else {
        throw Exception('Failed to create project: ${response.reasonPhrase}');
      }
    } catch (err) {
      Navigator.pop(context); // Закрываем диалог загрузки при ошибке

      // Показываем сообщение об ошибке
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error has occurred: $err')),
      );

      // throw Exception('Error has occured: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIcolors.appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Project title
              Card(
                elevation: 5,
                child: TextField(
                  controller: _projectTitleController,
                  focusNode: _titleFocusNode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter title',
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Project description
              Card(
                elevation: 5,
                child: TextField(
                  controller: _projectDescriptionController,
                  focusNode: _descriptionFocusNode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter description',
                  ),
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          createProject(
              _projectTitleController.text, _projectDescriptionController.text);
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 100),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: UIcolors.createProjectBtn,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'Create project',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
