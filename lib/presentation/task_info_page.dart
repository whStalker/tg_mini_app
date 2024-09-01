import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';

class TaskInfoPage extends StatefulWidget {
  const TaskInfoPage({super.key});

  @override
  State<TaskInfoPage> createState() => _TaskInfoPageState();
}

class _TaskInfoPageState extends State<TaskInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task title'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Some description about the task for developer. Some description about the task for developer',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),

            // Implementors for this tasks
            Card(
              elevation: 1,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    // User avatar
                    CircleAvatar(),

                    SizedBox(width: 20),
                    Text('First name'),

                    Spacer(),
                    Text('Role')
                  ],
                ),
              ),
            ),

            AnotherStepper(
              stepperList: [
                StepperData(
                  title: StepperText('Task added'),
                  subtitle: StepperText('30-08-2024'),
                ),
                StepperData(
                  title: StepperText('Task active'),
                  subtitle: StepperText('30-09-2024'),
                ),
                StepperData(
                  title: StepperText('Task complate'),
                  subtitle: StepperText('30-10S-2024'),
                ),
              ],
              stepperDirection: Axis.vertical,
            ),
          ],
        ),
      ),
    );
  }
}
