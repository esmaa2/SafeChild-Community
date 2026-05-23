import 'package:flutter/material.dart';
import 'kid_home_screen.dart';
import 'kid_learn_screen.dart';
import 'kid_tasks_screen.dart';
import 'kid_rewards_screen.dart';
import 'kid_profile_screen.dart';

class KidMainShell extends StatefulWidget {
  const KidMainShell({super.key});

  @override
  State<KidMainShell> createState() => _KidMainShellState();
}

class _KidMainShellState extends State<KidMainShell> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    KidHomeScreen(),
    KidLearnScreen(),
    KidTasksScreen(),
    KidRewardsScreen(),
    KidProfileScreen(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: _buildNavBar(),
    );
  }

  Widget _buildNavBar() {
    return Container(
      height: 78,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE5ECF5))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home_rounded, "Home", 0),
          _navItem(Icons.menu_book_rounded, "Learn", 1),
          _navItem(Icons.check_circle_rounded, "Tasks", 2),
          _navItem(Icons.star_rounded, "Stars", 3),
          _navItem(Icons.face_rounded, "Me", 4),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFEAF1FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 27,
              color: isActive ? const Color(0xFF3E72F2) : Colors.grey,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isActive ? const Color(0xFF3E72F2) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}