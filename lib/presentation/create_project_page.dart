import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tg_mini_app/constant/colors_const.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

TextEditingController _projectTitleController = TextEditingController();
TextEditingController _projectDescriptionController = TextEditingController();

int value = 0;
bool positive = false;

class _CreateProjectPageState extends State<CreateProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIcolors.appBackgroundColor,
      body: const Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Project title
              Card(
                elevation: 5,
                child: TextField(
                  decoration: InputDecoration(
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
                  decoration: InputDecoration(
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
        onTap: () {},
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
