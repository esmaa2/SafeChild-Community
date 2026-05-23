import 'package:flutter/material.dart';
import 'package:safechild/screens/parent/parent_home_screen.dart';
import 'package:safechild/screens/parent/my_kids_screen.dart';
import 'package:safechild/screens/parent/post_screen.dart';
import 'package:safechild/screens/parent/notifications_screen.dart';
import 'package:safechild/screens/parent/parent_profile_screen.dart';
import 'package:safechild/state/app_state.dart';
import 'package:safechild/screens/parent/finish_profile_alert.dart';
import 'package:safechild/screens/parent/complete_profile_setup_screen.dart';

class ParentMainShell extends StatefulWidget {
  const ParentMainShell({super.key});

  @override
  State<ParentMainShell> createState() => _ParentMainShellState();
}

class _ParentMainShellState extends State<ParentMainShell> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    ParentHomeScreen(),
    MyKidsScreen(),
    PostScreen(),
    NotificationsScreen(),
    ParentProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!AppState.parentProfileCompleted) {
        showFinishProfileAlert(
          context,
          onContinue: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CompleteProfileSetupScreen(),
              ),
            );

            setState(() {});
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F2),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(14, 8, 14, 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(0xFFE4DAD6)),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 12,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(Icons.home_rounded, 'Home', 0),
              _navItem(Icons.groups_rounded, 'My Kids', 1),
              _navItem(Icons.article_outlined, 'Feed', 2),
              _navItem(Icons.notifications_none_rounded, 'Alerts', 3),
              _navItem(Icons.person_outline_rounded, 'Profile', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final bool selected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF8E6E6) : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border: selected
              ? Border.all(
                  color: const Color(0xFFDC9B9B),
                  width: 1.4,
                )
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: selected
                  ? const Color(0xFFDC9B9B)
                  : const Color(0xFF7A6F73),
              size: 24,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                color: selected
                    ? const Color(0xFFDC9B9B)
                    : const Color(0xFF7A6F73),
              ),
            ),
          ],
        ),
      ),
    );
  }
}