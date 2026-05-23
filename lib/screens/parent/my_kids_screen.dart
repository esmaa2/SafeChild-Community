import 'package:flutter/material.dart';
import 'package:safechild/screens/parent/child_control_panel_screen.dart';
import 'package:safechild/screens/parent/edit_child_screen.dart';

class MyKidsScreen extends StatelessWidget {
  const MyKidsScreen({super.key});

  static const background = Color(0xFFFAF7F2);
  static const primary = Color(0xFF5FA8A7);
  static const rose = Color(0xFFDC9B9B);
  static const roseLight = Color(0xFFF8E6E6);
  static const tealLight = Color(0xFFE5F2F1);
  static const textDark = Color(0xFF2A2A2A);
  static const textMuted = Color(0xFF7A6F73);
  static const border = Color(0xFFE4DAD6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 110),
          children: const [
            _Header(),
            SizedBox(height: 18),
            _SearchBox(),
            SizedBox(height: 18),
            _KidCard(
              name: 'Emma',
              initial: 'E',
              age: 'Age 10 · 5th Grade',
              screenTime: '85m',
              lessons: '4',
              tasks: '3/5',
              avatarBg: roseLight,
              avatarColor: rose,
            ),
            SizedBox(height: 16),
            _KidCard(
              name: 'Lucas',
              initial: 'L',
              age: 'Age 7 · 2nd Grade',
              screenTime: '42m',
              lessons: '2',
              tasks: '1/4',
              avatarBg: tealLight,
              avatarColor: primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Kids',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: MyKidsScreen.textDark,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '2 children',
                style: TextStyle(
                  fontSize: 16,
                  color: MyKidsScreen.textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: MyKidsScreen.rose,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 28,
          ),
        ),
      ],
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: MyKidsScreen.border),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.search_rounded,
            color: MyKidsScreen.textMuted,
            size: 24,
          ),
          SizedBox(width: 12),
          Text(
            'Search children...',
            style: TextStyle(
              color: MyKidsScreen.textMuted,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _KidCard extends StatelessWidget {
  final String name;
  final String initial;
  final String age;
  final String screenTime;
  final String lessons;
  final String tasks;
  final Color avatarBg;
  final Color avatarColor;

  const _KidCard({
    required this.name,
    required this.initial,
    required this.age,
    required this.screenTime,
    required this.lessons,
    required this.tasks,
    required this.avatarBg,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: MyKidsScreen.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
  children: [
    Container(
      height: 86,
      decoration: BoxDecoration(
        color: avatarBg,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
    ),

    /// 🔥 Edit button (top right)
    Positioned(
      top: 10,
      right: 10,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EditChildScreen(
                childName: name,
              ),
            ),
          );
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.edit_rounded,
            size: 20,
            color: MyKidsScreen.primary,
          ),
        ),
      ),
    ),
  ],
),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, -32),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 72,
                        width: 72,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.045),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            initial,
                            style: TextStyle(
                              color: avatarColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: MyKidsScreen.tealLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Online',
                          style: TextStyle(
                            color: MyKidsScreen.primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: MyKidsScreen.textDark,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        age,
                        style: const TextStyle(
                          color: MyKidsScreen.textMuted,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _SmallStat(
                              icon: Icons.access_time_rounded,
                              value: screenTime,
                              label: 'Screen',
                              color: MyKidsScreen.primary,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _SmallStat(
                              icon: Icons.menu_book_rounded,
                              value: lessons,
                              label: 'Lessons',
                              color: MyKidsScreen.rose,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _SmallStat(
                              icon: Icons.checklist_rounded,
                              value: tasks,
                              label: 'Tasks',
                              color: Color(0xFFD18A45),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChildControlPanelScreen(
          childName: name,
        ),
      ),
    );
  },
  child: Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      color: MyKidsScreen.roseLight,
      borderRadius: BorderRadius.circular(18),
    ),
    child: const Center(
      child: Text(
        'View Control Panel',
        style: TextStyle(
          color: MyKidsScreen.rose,
          fontSize: 16,
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
  ),
),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _SmallStat({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F3EF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: MyKidsScreen.textDark,
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              color: MyKidsScreen.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}