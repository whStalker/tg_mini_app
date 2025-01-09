import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:tg_mini_app/constant/colors_const.dart';
import 'package:tg_mini_app/models/project_model.dart';
import 'package:tg_mini_app/models/task_model.dart';
import 'package:tg_mini_app/presentation/add_member_page.dart';
import 'package:tg_mini_app/presentation/create_task_page.dart';
import 'package:tg_mini_app/presentation/task_info_page.dart';

// ignore: must_be_immutable
class ProjectInfoPage extends StatefulWidget {
  Project projectData;
  ProjectInfoPage({super.key, required this.projectData});

  @override
  State<ProjectInfoPage> createState() => _ProjectInfoPageState();
}

class _ProjectInfoPageState extends State<ProjectInfoPage> {
  late Future<List<TaskModel>> _futureTasks;

  final List priorityColorList = [
    Colors.green,
    Colors.yellow,
    Colors.red,
  ];

  @override
  void initState() {
    super.initState();

    debugPrint('init run');

    _futureTasks = getAllProjectTasks();
  }

  Future<List<TaskModel>> getAllProjectTasks() async {
    final url = Uri.parse('http://localhost:8000/api/v1/task/1');
    debugPrint('url');

    final header = {
      "Content-Type": "application/json",
      "X-User":
          "query_id=AAGidl0XAAAAAKJ2XRfo6wnj&user=%7B%22id%22%3A392001186%2C%22first_name%22%3A%22%24%24%24%24%24%24%24%24%22%2C%22last_name%22%3A%22%22%2C%22username%22%3A%22Wicked_Heaven%22%2C%22language_code%22%3A%22ru%22%2C%22allows_write_to_pm%22%3Atrue%2C%22photo_url%22%3A%22https%3A%5C%2F%5C%2Ft.me%5C%2Fi%5C%2Fuserpic%5C%2F320%5C%2FhFUFITh51vMU1fnse245ZpoMiiPxSttywVgHmfvToIM.svg%22%7D&auth_date=1735829181&signature=zeihTXKpz8LaKY3Jv99nY4ZoQZGlBJc2RIvpgXtokSRX8bxkedUYpbH02UV7AN9ENM-Ud3zBW7Idl0ObQXoTBA&hash=4cd1431b5b688a9fd8518614e171489dc0a11ee310e86632f2b374ee7638a0af",
    };

    final body = jsonEncode({});

    try {
      final response = await http.post(url, headers: header, body: body);
      debugPrint('response');

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

        debugPrint('task data: ${response.body}');

        return data.map((json) => TaskModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load task: ${response.reasonPhrase}");
      }
    } catch (err) {
      throw Exception("Error has occured: $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectData.name),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: FutureBuilder(
          future: _futureTasks,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final objectData = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: double.tryParse('130'),
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.projectData.description,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // // Members
                  // const SizedBox(height: 5),
                  // Card(
                  //   elevation: 10,
                  //   child: InkWell(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const AddMemberPage(),
                  //         ),
                  //       );
                  //     },
                  //     child: const Padding(
                  //       padding: EdgeInsets.all(10),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Text(
                  //             '15',
                  //             style: TextStyle(fontSize: 18),
                  //           ),
                  //           SizedBox(width: 10),
                  //           Icon(Icons.people_alt_outlined),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // Tasks filter
                  // const SizedBox(height: 10),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: List.generate(
                  //       filterText.length,
                  //       (index) {
                  //         return GestureDetector(
                  //           onTap: () => _selectFilter(index),
                  //           child: Padding(
                  //             padding: const EdgeInsets.symmetric(horizontal: 5),
                  //             child: Container(
                  //               padding: const EdgeInsets.all(8),
                  //               decoration: BoxDecoration(
                  //                 border: Border.all(),
                  //                 borderRadius: BorderRadius.circular(15),
                  //                 color: _selectedIndex.contains(index)
                  //                     ? Colors.black // select color
                  //                     : Colors.transparent, // unselect
                  //               ),
                  //               child: Row(
                  //                 children: [
                  //                   Text(
                  //                     filterText[index],
                  //                     style: TextStyle(
                  //                       fontWeight: FontWeight.w600,
                  //                       color: _selectedIndex.contains(index)
                  //                           ? Colors.white
                  //                           : Colors.black,
                  //                     ),
                  //                   ),
                  //                   const SizedBox(width: 10),
                  //                   CircleAvatar(
                  //                     radius: 12,
                  //                     backgroundColor: Colors.grey[200],
                  //                     child: const Text(
                  //                       '15',
                  //                       style: TextStyle(
                  //                         fontSize: 12,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),

                  // Task
                  const SizedBox(height: 15),
                  if (snapshot.hasError)
                    Center(
                      child: Text('Something went wrong: ${snapshot.error}'),
                    ),

                  if (!snapshot.hasData || snapshot.data!.isEmpty)
                    const Center(
                      child: Text('No data'),
                    ),

                  if (snapshot.hasData)
                    Expanded(
                      child: ListView.builder(
                        itemCount: objectData.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final object = objectData![index];
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
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: UIcolors.userTaskCard,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Task title & status
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    object.name,
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Card(
                                                  elevation: 5,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 10,
                                                      vertical: 6,
                                                    ),
                                                    child: Text(
                                                      object.status.name,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                softWrap: true,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                object.description +
                                                    object.description +
                                                    object.description +
                                                    object.description +
                                                    object.description,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: priorityColorList[
                                              object.status.value - 1],
                                          borderRadius: const BorderRadius.only(
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
                    ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: UIcolors.navBarColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateTaskPage(),
            ),
          );
        },
        child: const Icon(
          Icons.playlist_add,
          color: Colors.white,
        ),
      ),
    );
  }
}
