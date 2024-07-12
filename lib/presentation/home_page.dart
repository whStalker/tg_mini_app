import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:telegram_web_app/telegram_web_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final tgUser = TelegramWebApp.instance.initDataUnsafe?.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Привет, ЮЗЕРНЕЙМ!'),
        backgroundColor: Colors.black,
        // Text('Список проектов ${tgUser?.first_name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10), //Arround Grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 150,
                ),

                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Date time
                        Row(
                          children: [
                            Text(DateFormat('MMMM dd, yyyy')
                                .format(DateTime.now())),
                          ],
                        ),

                        // Project title & icon
                        Row(
                          children: [
                            Icon(Icons.computer),
                            Text('Some title'),
                          ],
                        ),

                        // Progress indigator
                        Container(
                          color: Colors.green,
                          child: Column(
                            children: [
                              Text('Progress'),
                              LinearProgressIndicator(
                                value: 0.6
                              ),
                              Text('60%'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Text(
                    //     'Some test text.Some test text.Some test text.Some test text.Some test text.'),
                  );
                },
              ),
              // ListView.builder(
              //   itemCount: 1,
              //   itemBuilder: (context, index) {
              //     return Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         height: 150,
              //         width: double.infinity,
              //         decoration: BoxDecoration(
              //           color: Colors.grey[300],
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.all(10),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text('Проект ${index + 1}'),
              //               const Text('Описания'),
              //               const Align(
              //                 alignment: Alignment.centerRight,
              //                 child: Icon(Icons.arrow_forward_ios),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
