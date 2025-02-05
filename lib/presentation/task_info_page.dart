import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:tg_mini_app/models/task_model.dart';

class TaskInfoPage extends StatefulWidget {
  TaskModel taskData;
  TaskInfoPage({super.key, required this.taskData});

  @override
  State<TaskInfoPage> createState() => _TaskInfoPageState();
}

late TextEditingController _titleEditController;

late TextEditingController _descriptionEditController;

class _TaskInfoPageState extends State<TaskInfoPage> {
  List<Map<String, dynamic>> priorityList = [];
  List<Map<String, dynamic>> statusList = [];

  int? selectedPriorityValue;
  int? selectedStatusValue;

  @override
  void initState() {
    super.initState();

    getTaskPriority();
    getTaskStatus();

    selectedPriorityValue = widget.taskData.priority.value;
    selectedStatusValue = widget.taskData.status.value;

    _titleEditController = TextEditingController(text: widget.taskData.name);
    _descriptionEditController =
        TextEditingController(text: widget.taskData.description);
  }

  // Task priority
  Future<void> getTaskPriority() async {
    final url = Uri.parse("http://localhost:8000/api/v1/project/1/priority");

    final header = {
      "Content-Type": "application/json",
      "X-User":
          "query_id=AAGidl0XAAAAAKJ2XRc_c0l3&user=%7B%22id%22%3A392001186%2C%22first_name%22%3A%22%24%24%24%24%24%24%24%24%22%2C%22last_name%22%3A%22%22%2C%22username%22%3A%22Wicked_Heaven%22%2C%22language_code%22%3A%22ru%22%2C%22allows_write_to_pm%22%3Atrue%2C%22photo_url%22%3A%22https%3A%5C%2F%5C%2Ft.me%5C%2Fi%5C%2Fuserpic%5C%2F320%5C%2FhFUFITh51vMU1fnse245ZpoMiiPxSttywVgHmfvToIM.svg%22%7D&auth_date=1731945334&signature=Bkvjr3IG-K0_2xGiQdPqRdqXkGrvIP1lTi2QqnZGJtiORn7jWHf5eVECRmcNXFMsZoAhWNIGt2Pe8qK04tEcAw&hash=141298c2c9e7ed7aefc143afebf80ac444448ce17687da648c29458615743a78",
    };

    try {
      final response = await http.get(url, headers: header);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
        debugPrint('priority data: $data');

        setState(() {
          priorityList = data
              .map<Map<String, dynamic>>((json) => {
                    'id': json['id'],
                    'name': json['name'],
                    'value': json['value'],
                  })
              .toList();
        });
      } else {
        throw Exception('Failed to load priority: ${response.reasonPhrase}');
      }
    } catch (err) {}
  }

  // Task status
  Future<void> getTaskStatus() async {
    final url = Uri.parse("http://localhost:8000/api/v1/project/1/status");

    final header = {
      "Content-Type": "application/json",
      "X-User":
          "query_id=AAGidl0XAAAAAKJ2XRc_c0l3&user=%7B%22id%22%3A392001186%2C%22first_name%22%3A%22%24%24%24%24%24%24%24%24%22%2C%22last_name%22%3A%22%22%2C%22username%22%3A%22Wicked_Heaven%22%2C%22language_code%22%3A%22ru%22%2C%22allows_write_to_pm%22%3Atrue%2C%22photo_url%22%3A%22https%3A%5C%2F%5C%2Ft.me%5C%2Fi%5C%2Fuserpic%5C%2F320%5C%2FhFUFITh51vMU1fnse245ZpoMiiPxSttywVgHmfvToIM.svg%22%7D&auth_date=1731945334&signature=Bkvjr3IG-K0_2xGiQdPqRdqXkGrvIP1lTi2QqnZGJtiORn7jWHf5eVECRmcNXFMsZoAhWNIGt2Pe8qK04tEcAw&hash=141298c2c9e7ed7aefc143afebf80ac444448ce17687da648c29458615743a78",
    };

    try {
      final response = await http.get(url, headers: header);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
        debugPrint('status data: $data');

        setState(() {
          statusList = data
              .map<Map<String, dynamic>>((json) => {
                    'id': json['id'],
                    'name': json['name'],
                    'value': json['value'],
                  })
              .toList();
        });
      } else {
        throw Exception('Failed to load priority: ${response.reasonPhrase}');
      }
    } catch (err) {}
  }

  // Update task data
  Future<void> updateTaskData(TaskModel task) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.taskData.name),
        // centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // save task
              debugPrint('print: $priorityList');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task title
            const Text(
              'Название задачи',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),

            // Task title input
            SizedBox(
              height: 40,
              child: TextFormField(
                controller: _titleEditController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  hintText: 'Введите названия задачи',
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Task description
            const Text(
              'Описание задачи',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),

            // Task description input
            TextField(
              controller: _descriptionEditController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                hintText: 'Добавьте описание задачи',
                hintStyle: TextStyle(color: Colors.black54, fontSize: 15),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              ),
              maxLines: 4,
            ),

            const SizedBox(height: 15),

            //Task participants
            const Row(
              children: [
                Icon(Icons.person),
                Text(
                  'Исполнитель',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            // Task participants dropdown btn
            DropdownButton(
              items: ['Andre', 'John', 'Doe', 'Jane'].map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
              isExpanded: true,
            ),

            const SizedBox(height: 15),

            //Task deadline
            const Row(
              children: [
                Icon(Icons.calendar_today_outlined),
                Text(
                  'Срок выполнения',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const SizedBox(height: 15),

            //Task priority
            const Row(
              children: [
                Icon(Icons.flag_outlined),
                Text(
                  'Приоритет',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            // Task priority dropdown btn
            DropdownButton(
              value: selectedPriorityValue,
              items: priorityList.map((priority) {
                return DropdownMenuItem(
                  value: priority['value'],
                  child: Text(priority['name']),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedPriorityValue = value as int;
                  });
                  updateTaskData(
                    TaskModel(
                      name: _titleEditController.text,
                      description: _descriptionEditController.text,
                      project: widget.taskData.project,
                      taskCreator: widget.taskData.taskCreator,
                      status: widget.taskData.status,
                      priority: widget.taskData.priority,
                    ),
                  );
                }
                debugPrint('selected priority: $value');
              },
              isExpanded: true,
            ),

            const SizedBox(height: 15),

            //Task status
            const Row(
              children: [
                Icon(Icons.error_outline),
                Text(
                  'Статус',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            // Task status dropdown btn
            DropdownButton(
              value: selectedStatusValue,
              items: statusList.map((status) {
                return DropdownMenuItem(
                  value: status['value'],
                  child: Text(status['name']),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedStatusValue = value as int;
                  });
                }
                debugPrint('selected status: $value');
              },
              isExpanded: true,
            ),
          ],
        ),
      ),
    );
  }
}
