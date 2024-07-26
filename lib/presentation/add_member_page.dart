import 'package:flutter/material.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({super.key});

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Project participants'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // User avatar
                    CircleAvatar(),
      
                    SizedBox(width: 20),
      
                    // User name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('First name'),
                        Text('Username'),
                      ],
                    ),
                    Spacer(),
                    Text('Role')
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 10,
        child: const Icon(Icons.person_add_alt_1),
      ),
    );
  }
}
