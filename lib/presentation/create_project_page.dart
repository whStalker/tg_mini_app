import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Project title
              TextField(
                controller: _projectTitleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter title',
                ),
              ),

              const SizedBox(height: 20),

              // Project description
              TextField(
                controller: _projectDescriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter description',
                  alignLabelWithHint: true,
                ),
                maxLines: 3,
              ),

              const SizedBox(height: 20),

              // Mark project private or public
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Project status',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AnimatedToggleSwitch.dual(
                    current: positive,
                    first: true,
                    second: false,
                    spacing: -20, // toggle width
                    height: 35,
                    borderWidth: 2,
                    onChanged: (i) => setState(() => positive = i),
                    iconBuilder: (value) => FaIcon(
                      value ? FontAwesomeIcons.lock : FontAwesomeIcons.lockOpen,
                      size: 20,
                    ),

                    style: ToggleStyle(
                      borderColor: Colors.transparent,
                      backgroundColor: Colors.grey[300],
                      indicatorColor: Colors.white,
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                    ),
                  ),

                  //   AnimatedToggleSwitch<bool>.dual(
                  //   current: positive,
                  //   first: false,
                  //   second: true,
                  //   spacing: 50.0,
                  //   style: const ToggleStyle(
                  //     borderColor: Colors.transparent,
                  //     boxShadow: const [
                  //       BoxShadow(
                  //         color: Colors.black26,
                  //         spreadRadius: 1,
                  //         blurRadius: 2,
                  //         offset: Offset(0, 1.5),
                  //       ),
                  //     ],
                  //   ),
                  //   borderWidth: 5.0,
                  //   height: 55,
                  //   onChanged: (b) => setState(() => positive = b),
                  //   styleBuilder: (b) =>
                  //       ToggleStyle(indicatorColor: b ? Colors.red : Colors.green),
                  //   iconBuilder: (value) => value
                  //       ? Icon(Icons.coronavirus_rounded)
                  //       : Icon(Icons.tag_faces_rounded),
                  //   textBuilder: (value) => value
                  //       ? Center(child: Text('Oh no...'))
                  //       : Center(child: Text('Nice :)')),
                  // ),
                ],
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
              color: Colors.black,
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
