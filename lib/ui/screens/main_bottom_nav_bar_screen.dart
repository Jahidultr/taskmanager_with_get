import 'package:flutter/material.dart';
import 'package:taskmanager_with_get/ui/screens/cancelled_task_screen.dart';
import 'package:taskmanager_with_get/ui/screens/completed_task_screen.dart';
import 'package:taskmanager_with_get/ui/screens/new_task_screen.dart';
import 'package:taskmanager_with_get/ui/screens/progress_task_screen.dart';
import 'package:taskmanager_with_get/ui/utils/app_colors.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
    ProgressTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Row(
          children: [
            CircleAvatar(
              radius: 19,
              // backgroundImage: Image.asset('assets/images/jahid.JPG'),
              backgroundColor: Colors.white,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jahidul Islam',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'jahidul@gmail.com',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        backgroundColor: Colors.blue,
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.new_label,
            ),
            label: 'New',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_box),
            label: 'Completed',
          ),
          NavigationDestination(
            icon: Icon(Icons.cancel_outlined),
            label: 'Canceled',
          ),
          NavigationDestination(
            icon: Icon(Icons.pix_rounded),
            label: 'progress',
          ),
        ],
      ),
    );
  }
}
