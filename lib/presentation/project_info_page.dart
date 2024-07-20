import 'package:flutter/material.dart';

class ProjectInfoPage extends StatefulWidget {
  const ProjectInfoPage({super.key});

  @override
  State<ProjectInfoPage> createState() => _ProjectInfoPageState();
}

class _ProjectInfoPageState extends State<ProjectInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Some text title'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (context, index) {
                return Text('Some Text');
              },
            ),
          ),
        ],
      ),
    );
  }
}
