import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:tg_mini_app/presentation/create_project_page.dart';
import 'package:tg_mini_app/presentation/home_page.dart';
import 'package:tg_mini_app/presentation/tasks_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

final NotchBottomBarController _barController = NotchBottomBarController();

int _selectIndex=0;

List _pages = const [
  HomePage(),
  CreateProjectPage(),
  TasksPage(),
];

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectIndex],
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _barController,
        onTap: (value) {
          setState(() {
            _selectIndex=value;
          });
        },
        kIconSize: 20,
        kBottomRadius: 30,
        shadowElevation: 8,

        // notchColor: Colors.red,                  // Circle color

        // notchGradient: const LinearGradient(     // Circule gradient
        //   begin: Alignment.topRight,
        //   end: Alignment.bottomLeft,
        //   colors: [
        //     Colors.red,
        //     Colors.green,
        //   ],
        // ),

        bottomBarWidth: MediaQuery.sizeOf(context).width,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Icons.home_filled),
            activeItem: Icon(Icons.home),
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.add),
            activeItem: Icon(Icons.add_circle_outline),
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.list_alt),
            activeItem: Icon(Icons.list),
          ),
        ],
      ),
    );
  }
}
