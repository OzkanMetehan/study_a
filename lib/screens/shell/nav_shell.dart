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
  int _index = 2; // center tab (Home)

  late final List<Widget> _pages;

  static const double _baseIconSize = 24.0;
  static const double _selectedIconSize = _baseIconSize * 1.15; // 15% larger when selected

  Widget _navIcon(String name, {bool selected = false}) => ImageIcon(
        AssetImage('assets/icons/' + name + '.png'),
        size: selected ? _selectedIconSize : _baseIconSize,
      );

  @override
  void initState() {
    super.initState();
    // Order MUST match NavigationDestination order below
    _pages = [
      const LibraryScreen(),
      const CalendarScreen(),
      const HomeScreen(),
      const AnalyticsScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(
            icon: _navIcon('library'),
            selectedIcon: _navIcon('library', selected: true),
            label: 'Library',
          ),
          NavigationDestination(
            icon: _navIcon('calendar'),
            selectedIcon: _navIcon('calendar', selected: true),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: _navIcon('home'),
            selectedIcon: _navIcon('home', selected: true),
            label: 'Home',
          ),
          NavigationDestination(
            icon: _navIcon('analytics'),
            selectedIcon: _navIcon('analytics', selected: true),
            label: 'Analytics',
          ),
          NavigationDestination(
            icon: _navIcon('profile'),
            selectedIcon: _navIcon('profile', selected: true),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
