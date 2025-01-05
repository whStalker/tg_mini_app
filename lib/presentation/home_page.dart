import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'package:tg_mini_app/constant/colors_const.dart';
import 'package:tg_mini_app/models/project_model.dart';
import 'package:tg_mini_app/presentation/project_info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final tgUser = TelegramWebApp.instance.initDataUnsafe?.user;

  late Future<List<Project>> _futureProject;

  @override
  void initState() {
    super.initState();
    _futureProject = getAllProject();
  }

  List<Project> projectList = [];

  Future<List<Project>> getAllProject() async {
    final url = Uri.parse('http://localhost:8000/api/v1/project/');

    final header = {
      "Content-Type": "application/json",
      "X-User":
          "query_id=AAGidl0XAAAAAKJ2XRc_c0l3&user=%7B%22id%22%3A392001186%2C%22first_name%22%3A%22%24%24%24%24%24%24%24%24%22%2C%22last_name%22%3A%22%22%2C%22username%22%3A%22Wicked_Heaven%22%2C%22language_code%22%3A%22ru%22%2C%22allows_write_to_pm%22%3Atrue%2C%22photo_url%22%3A%22https%3A%5C%2F%5C%2Ft.me%5C%2Fi%5C%2Fuserpic%5C%2F320%5C%2FhFUFITh51vMU1fnse245ZpoMiiPxSttywVgHmfvToIM.svg%22%7D&auth_date=1731945334&signature=Bkvjr3IG-K0_2xGiQdPqRdqXkGrvIP1lTi2QqnZGJtiORn7jWHf5eVECRmcNXFMsZoAhWNIGt2Pe8qK04tEcAw&hash=141298c2c9e7ed7aefc143afebf80ac444448ce17687da648c29458615743a78",
    };

    try {
      final response = await http.get(url, headers: header);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
        debugPrint('data: $data');

        return data.map((json) => Project.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load project: ${response.reasonPhrase}');
      }
    } catch (err) {
      throw Exception('Error has occured: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIcolors.appBackgroundColor,
      body: FutureBuilder(
          future: _futureProject,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data'));
            }

            final objectData = snapshot.data!;

            return Column(
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

                  itemCount: objectData.length,
                  itemBuilder: (context, index) {
                    final object = objectData[index];
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
                              Row(
                                children: [
                                  const SizedBox(width: 10),
                                  const Icon(Icons.computer),
                                  const SizedBox(width: 15),
                                  Flexible(
                                    child: Text(
                                      object.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: const TextStyle(
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
                                    backgroundColor:
                                        UIcolors.progressIndicatorBgColor,
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
            );
          }),
    );
  }
}
