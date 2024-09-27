import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tg_mini_app/constant/colors_const.dart';

import 'package:tg_mini_app/presentation/project_info_page.dart';

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
      backgroundColor:  UIcolors.appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Padding(
            //   padding: EdgeInsets.all(10),
            //   child: Text(
            //     'Привет, ЮЭЕР!',
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            //   ),
            // ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 110), //Arround Grid
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 200,
              ),

              itemCount: 8,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProjectInfoPage(),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      // side: const BorderSide(),
                    ),
                    elevation: 20,
                    color: UIcolors.projectCardBgColor,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Date time
                          Row(
                            children: [
                              Text(DateFormat('MMM dd, yyyy')
                                  .format(DateTime.now())),
                            ],
                          ),

                          // Project title & icon
                          const Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.computer),
                              SizedBox(width: 15),
                              Flexible(
                                child: Text(
                                  'Some title Some title Some title',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Progress indigator
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Progress'),
                              const SizedBox(height: 10),
                              LinearProgressIndicator(
                                value: 0.6,
                                borderRadius: BorderRadius.circular(10),
                                minHeight: 5,
                                color: UIcolors.progressIndicatorColor,
                                backgroundColor: UIcolors.progressIndicatorBgColor,
                              ),
                              const SizedBox(height: 5),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text('60%'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
