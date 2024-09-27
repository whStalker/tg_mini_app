import 'package:flutter/material.dart';
import 'package:tg_mini_app/constant/colors_const.dart';

class UserTasksPage extends StatelessWidget {
  const UserTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIcolors.appBackgroundColor,
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 130,
              // width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: UIcolors.userTaskCard,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Task name
                        Text(
                          'Task title',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: UIcolors.userTaskTitle,
                          ),
                        ),

                        // Project name
                        Text(
                          'Project name',
                          style: TextStyle(
                            fontSize: 16,
                            color: UIcolors.userTaskTitle,
                          ),
                        ),

                        //
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 20,
                    decoration: const BoxDecoration(
                      color: UIcolors.createProjectBtn,
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
    );
  }
}
