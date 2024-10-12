import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tg_mini_app/constant/colors_const.dart';
import 'package:tg_mini_app/presentation/create_project_page.dart';
import 'package:tg_mini_app/presentation/home_page.dart';
import 'package:tg_mini_app/presentation/user_tasks_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

final NotchBottomBarController _barController = NotchBottomBarController();

int _selectIndex = 0;

List _pages = const [
  HomePage(),
  CreateProjectPage(),
  UserTasksPage(),
];

List _appBarTitle = [
  'Home',
  'Create project',
  'Tasks list',
];

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          _appBarTitle[_selectIndex],
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.circleUser),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.bell),
          ),
        ],
      ),
      body: _pages[_selectIndex],
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _barController,
        color: UIcolors.navBarColor,
        notchColor: UIcolors.activeNavColor,
        onTap: (value) {
          setState(() {
            _selectIndex = value;
          });
        },
        kIconSize: 24,
        kBottomRadius: 28,
        bottomBarWidth: MediaQuery.sizeOf(context).width,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Icons.home, color: Colors.white),
            activeItem: Icon(Icons.home),
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.add, color: Colors.white),
            activeItem: Icon(Icons.add),
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.list, color: Colors.white),
            activeItem: Icon(Icons.list),
          ),
        ],
      ),
    );
  }
}
