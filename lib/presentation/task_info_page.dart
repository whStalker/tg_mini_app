import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';

class TaskInfoPage extends StatefulWidget {
  const TaskInfoPage({super.key});

  @override
  State<TaskInfoPage> createState() => _TaskInfoPageState();
}

TextEditingController _titleEditController =
    TextEditingController(text: 'Tg mini app');

TextEditingController _descriptionEditController =
    TextEditingController(text: 'Tg mini app description');

int _selectedIndex = -1;

bool _titleReadOnly = true;
bool _descriptionReadOnly = true;

final List<Color?> _colors = [
    Colors.green[200],
    Colors.yellow[200],
    Colors.red[200],
  ];

class _TaskInfoPageState extends State<TaskInfoPage> {
  void _onEditField() {
    setState(() {
      _titleReadOnly = !_titleReadOnly;

      try {
        if (_titleReadOnly) {
          debugPrint('Send request');
        }
      } catch (e) {
        _titleReadOnly = false;
      }
    });
  }

  void animateContainer(int index) {
    setState(() {
      _selectedIndex = index;
    });
    debugPrint('container $index tap');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task title'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Task title
            Card(
              child: TextField(
                controller: _titleEditController,
                readOnly: _titleReadOnly,
                decoration: InputDecoration(
                  border:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _onEditField();
                    },
                    icon: Icon(_titleReadOnly ? Icons.edit : Icons.check),
                  ),
                ),
                maxLines: 3,
              ),
            ),

            // Task description
            Card(
              child: TextField(
                controller: _descriptionEditController,
                readOnly: true,
                decoration: InputDecoration(
                  border:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                  ),
                ),
                maxLines: 3,
              ),
            ),

            // Task priority
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Task priority'),
                  Row(
                    children: List.generate(3, (index) {
                      return GestureDetector(
                        onTap: () {
                          animateContainer(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: AnimatedContainer(
                            width: _selectedIndex == index ? 50 : 30,
                            decoration: BoxDecoration(
                              color: _colors[index],
                              borderRadius: BorderRadius.circular(10),
                              border: _selectedIndex==index ? Border.all(
                                width: 1.2,
                              ) : null,
                            ),
                            duration: const Duration(milliseconds: 400),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
