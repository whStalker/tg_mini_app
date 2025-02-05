import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class CreateTaskPage extends StatefulWidget {
  final projectId;
  const CreateTaskPage({super.key, this.projectId});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

TextEditingController _taskTitleController = TextEditingController();
TextEditingController _taskDescController = TextEditingController();

class _CreateTaskPageState extends State<CreateTaskPage> {
  DateTime? _selectedDate;

  int? _selectedPriority;

  final List<Color?> _colors = [
    Colors.green[200],
    Colors.yellow[200],
    Colors.red[200],
  ];

  void _selectPriority(index) {
    setState(() {
      _selectedPriority = index;
    });
  }

  Future<void> createTask(
    String name,
    String description,
    int project,
    int priority,
    int status,
    String endAt,
    int implementer,
  ) async {
    final url = Uri.parse("http://localhost:8000/api/v1/task/");

    final header = {
      "Content-Type": "application/json",
      "X-User":
          "query_id=AAGidl0XAAAAAKJ2XRc_c0l3&user=%7B%22id%22%3A392001186%2C%22first_name%22%3A%22%24%24%24%24%24%24%24%24%22%2C%22last_name%22%3A%22%22%2C%22username%22%3A%22Wicked_Heaven%22%2C%22language_code%22%3A%22ru%22%2C%22allows_write_to_pm%22%3Atrue%2C%22photo_url%22%3A%22https%3A%5C%2F%5C%2Ft.me%5C%2Fi%5C%2Fuserpic%5C%2F320%5C%2FhFUFITh51vMU1fnse245ZpoMiiPxSttywVgHmfvToIM.svg%22%7D&auth_date=1731945334&signature=Bkvjr3IG-K0_2xGiQdPqRdqXkGrvIP1lTi2QqnZGJtiORn7jWHf5eVECRmcNXFMsZoAhWNIGt2Pe8qK04tEcAw&hash=141298c2c9e7ed7aefc143afebf80ac444448ce17687da648c29458615743a78",
    };

    final body = jsonEncode({
      "name": name,
      "description": description,
      "project": project,
      "priority": priority,
      "status": status,
      "end_at": endAt,
      "implementer": implementer,
    });

    try {
      final response = await http.post(
        url,
        headers: header,
        body: body,
      );

      if (response.statusCode == 200) {
        _taskTitleController.clear();
        _taskDescController.clear();
        _selectedDate = null;

        debugPrint('Task created successfully');
      } else {
        throw Exception('Failed to create task: ${response.reasonPhrase}');
      }
    } catch (err) {
      debugPrint('Failed to create task: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create task',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Task title field
              const Text(
                'Task title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                controller: _taskTitleController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Enter task title',
                  prefixIcon: const Icon(Icons.featured_play_list_rounded),
                ),
              ),

              const SizedBox(height: 20),

              // Task description field
              const Text(
                'Task description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // TODO: fix textfield icon
              TextField(
                controller: _taskDescController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Enter task description',
                  prefixIcon: const Icon(Icons.featured_play_list_rounded),
                ),
                maxLines: 4,
              ),

              const SizedBox(height: 20),

              // Deadline field
              const Text(
                'Deadline',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // TODO: fix date picker
              GestureDetector(
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    // locale: const Locale('ru', 'RU'),
                  );
                  if (pickedDate != null && pickedDate != _selectedDate) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_selectedDate != null
                          ? '${_selectedDate}'
                          : 'Выберите дату'),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Task priority
              const Text(
                'Priority',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(3, (index) {
                    return Flexible(
                      child: GestureDetector(
                        onTap: () {
                          _selectPriority(index + 1);
                          debugPrint('Priority: $_selectedPriority');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _selectedPriority == index + 1
                                  ? _colors[index]
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                index == 0
                                    ? 'Low'
                                    : index == 1
                                        ? 'Medium'
                                        : 'High',
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 20),

              // Participants
              const Text(
                'Participants',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Add new participant
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(Icons.add),
                    ),

                    const SizedBox(width: 10),
                    // Test data -> participants
                    Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // user avatar
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                          ),

                          // username
                          Text(
                            "\$\$\$\$\$\$",
                            style: TextStyle(fontSize: 18),
                          ),

                          // deleate icon
                          Icon(Icons.cancel),
                        ],
                      ),
                    ),

                    //2
                    Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // user avatar
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                          ),

                          // username
                          Text(
                            "\$\$\$\$\$\$",
                            style: TextStyle(fontSize: 18),
                          ),

                          // deleate icon
                          Icon(Icons.cancel),
                        ],
                      ),
                    ),

                    //3
                    Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // user avatar
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                          ),

                          // username
                          Text(
                            "\$\$\$\$\$\$",
                            style: TextStyle(fontSize: 18),
                          ),

                          // deleate icon
                          Icon(Icons.cancel),
                        ],
                      ),
                    ),

                    //4
                    Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // user avatar
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                          ),

                          // username
                          Text(
                            "\$\$\$\$\$\$",
                            style: TextStyle(fontSize: 18),
                          ),

                          // deleate icon
                          Icon(Icons.cancel),
                        ],
                      ),
                    ),

                    //5
                    Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // user avatar
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                          ),

                          // username
                          Text(
                            "\$\$\$\$\$\$",
                            style: TextStyle(fontSize: 18),
                          ),

                          // deleate icon
                          Icon(Icons.cancel),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            // TODO: add valid implementor
            createTask(
              _taskDescController.text,
              _taskDescController.text,
              widget.projectId,
              _selectedPriority!,
              1,
              _selectedDate.toString(),
              392001186,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              '+   Create task',
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
