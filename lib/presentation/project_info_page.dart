import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:tg_mini_app/presentation/add_member_page.dart';
import 'package:tg_mini_app/presentation/tasks_list_page.dart';

class ProjectInfoPage extends StatefulWidget {
  const ProjectInfoPage({super.key});

  @override
  State<ProjectInfoPage> createState() => _ProjectInfoPageState();
}

int _selectedIdex = 1;

final List filterText = [
  'All',
  'In progress',
  'In Review',
  'Complete',
];

final List<Color?> _colors = [
  Colors.grey,
  Colors.amber[200],
  Colors.pink[200],
  Colors.green,
];

class _ProjectInfoPageState extends State<ProjectInfoPage> {
  void _selectFilter(index) {
    setState(() {
      _selectedIdex = index;
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
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.5,
                    mainAxisExtent: 120,
                  ),
                  children: [
                    // Go to project participants screen
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddMemberPage(),
                          ),
                        );
                        debugPrint('on tap');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 0.3,
                          ),
                        ),
                        elevation: 15,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '15',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Participants',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Go to project task screen
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TasksListPage(),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 0.3,
                          ),
                        ),
                        elevation: 15,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '15',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'All tasks',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // const Text(
              //   'Tasks in progress',
              //   style: TextStyle(
              //     fontSize: 22,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              Row(
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () => _selectFilter(index),
                    child: Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15),
                            color: _selectedIdex == index
                                ? Colors.grey[400]
                                : Colors.transparent,
                          ),
                          child: Row(
                            children: [
                              Text(
                                filterText[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 10),
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: _colors[index],
                                child: const Text('15'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 15),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 130,
                      // width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Task name
                                const Text(
                                  'Task title',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
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
                                      totalCount: 5,
                                      imageRadius: 30,
                                    ),
                                  ],
                                ),

                                //
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
