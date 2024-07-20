import 'dart:math';

import 'package:flutter/material.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

TextEditingController _taskTitleController = TextEditingController();
TextEditingController _taskDescController = TextEditingController();

class _CreateTaskPageState extends State<CreateTaskPage> {
  int _selectedIdex = -1;

  final List<Color?> _colors = [
    Colors.green[200],
    Colors.yellow[200],
    Colors.red[200],
  ];

  void _selectPriority(index) {
    setState(() {
      _selectedIdex = index;
    });
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
              TextField(
                controller: _taskDescController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Enter task description',
                  // prefixIcon: Align(
                  //   heightFactor: 4,
                  //   widthFactor: 0,
                  //   alignment: Alignment.topLeft,
                  //   child: Icon(Icons.featured_play_list_rounded),
                  // ),

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
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Enter task deadline',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
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
                          _selectPriority(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _selectedIdex == index
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
    );
  }
}
