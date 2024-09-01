import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';

import 'package:tg_mini_app/presentation/add_member_page.dart';
import 'package:tg_mini_app/presentation/create_task_page.dart';
import 'package:tg_mini_app/presentation/task_info_page.dart';

class ProjectInfoPage extends StatefulWidget {
  const ProjectInfoPage({super.key});

  @override
  State<ProjectInfoPage> createState() => _ProjectInfoPageState();
}

List<int> _selectedIndex = [0];

final List filterText = [
  'All',
  'In progress',
  'In Review',
  'Complete',
  'To Do'
];

class _ProjectInfoPageState extends State<ProjectInfoPage> {
  void _selectFilter(int index) {
    setState(() {
      if (_selectedIndex.contains(index)) {
        _selectedIndex.remove(index);
      } else {
        _selectedIndex.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project name'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: double.tryParse('130'),
                width: double.infinity,
                child: const Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Project some description. Project some description. Project some description',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 5),
              Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddMemberPage(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '15',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.people_alt_outlined),
                      ],
                    ),
                  ),
                ),
              ),

              // Tasks filter
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    filterText.length,
                    (index) {
                      return GestureDetector(
                        onTap: () => _selectFilter(index),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(15),
                              color: _selectedIndex.contains(index)
                                  ? Colors.black // select color
                                  : Colors.transparent, // unselect
                            ),
                            child: Row(
                              children: [
                                Text(
                                  filterText[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: _selectedIndex.contains(index)
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.grey[200],
                                  child: const Text(
                                    '15',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Task
              const SizedBox(height: 15),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TaskInfoPage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        elevation: 10,
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  right: 10,
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Task name
                                    const Text(
                                      'Task title',
                                      softWrap: true,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    // Project name
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Project name'),
                                        ImageStack(
                                          imageList: const ['1', '2', '3', '4'],
                                          imageCount: 2,
                                          totalCount: 10,
                                          extraCountTextStyle: const TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 150,
                                width: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateTaskPage(),
            ),
          );
        },
        child: const Icon(Icons.playlist_add),
      ),
    );
  }
}
