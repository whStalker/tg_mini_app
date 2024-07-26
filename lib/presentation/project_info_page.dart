import 'package:flutter/material.dart';
import 'package:tg_mini_app/presentation/add_member_page.dart';
import 'package:tg_mini_app/presentation/tasks_list_page.dart';

class ProjectInfoPage extends StatefulWidget {
  const ProjectInfoPage({super.key});

  @override
  State<ProjectInfoPage> createState() => _ProjectInfoPageState();
}

class _ProjectInfoPageState extends State<ProjectInfoPage> {
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
            children: [
              SizedBox(
                height: double.tryParse('120'),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.5,
                    mainAxisExtent: 100,
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
                        elevation: 5,
                        child: const Text('15\nParticipants'),
                      ),
                    ),

                    // Got to project task screen
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
                        elevation: 5,
                        child: const Text('15\nTask in process'),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: 40,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Text('Index $index');
                },
              ),
            ],
          ),
        ),
      ),

      // SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(15),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         // Dashbord -> contain project info

      //         SizedBox(
      //           height: MediaQuery.sizeOf(context).height * 0.3,
      //           child: GridView(
      //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               crossAxisSpacing: 15,
      //               mainAxisSpacing: 15,
      //               childAspectRatio: 2.5,
      //               mainAxisExtent: 100,
      //             ),
      //             children: [
      //               Card(
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(15),
      //                   side: const BorderSide(
      //                     color: Colors.black,
      //                     width: 0.3,
      //                   ),
      //                 ),
      //                 elevation: 5,
      //                 child: Text('15\nParticipants'),
      //               ),
      //               Card(
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(15),
      //                   side: const BorderSide(
      //                     color: Colors.black,
      //                     width: 0.3,
      //                   ),
      //                 ),
      //                 elevation: 5,
      //                 child: Text('15\nTask in process'),
      //               ),
      //               Card(
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(15),
      //                   side: const BorderSide(
      //                     color: Colors.black,
      //                     width: 0.3,
      //                   ),
      //                 ),
      //                 elevation: 5,
      //                 child: Text('15\nParticipants'),
      //               ),
      //               Card(
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(15),
      //                   side: const BorderSide(
      //                     color: Colors.black,
      //                     width: 0.3,
      //                   ),
      //                 ),
      //                 elevation: 5,
      //                 child: Text('15\nTask in process'),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
