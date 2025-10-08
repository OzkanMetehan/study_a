import 'package:flutter/material.dart';
import 'package:study_a/screens/home/home_screen.dart';
import 'package:study_a/screens/library/library_screen.dart';
import 'package:study_a/screens/calendar/calendar_screen.dart';
import 'package:study_a/screens/analytics/analytics_screen.dart';
import 'package:study_a/screens/profile/profile_screen.dart';

class NavShell extends StatefulWidget {
  const NavShell({super.key});
  @override
  State<NavShell> createState() => _NavShellState();
}

class _NavShellState extends State<NavShell> {
  int _index = 0;

  final _pages = const [
    HomeScreen(),
    LibraryScreen(),
    CalendarScreen(),
    AnalyticsScreen(),
    ProfileScreen(),
  ];

  Widget _navIcon(String name) => ImageIcon(AssetImage('assets/icons/' + name + '.png'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(icon: _navIcon('home'), label: 'Home'),
          NavigationDestination(icon: _navIcon('library'), label: 'Library'),
          NavigationDestination(icon: _navIcon('calendar'), label: 'Calendar'),
          NavigationDestination(icon: _navIcon('analytics'), label: 'Analytics'),
          NavigationDestination(icon: _navIcon('profile'), label: 'Profile'),
        ],
      ),
    );
  }
}
