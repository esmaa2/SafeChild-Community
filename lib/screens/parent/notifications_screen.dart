import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const background = Color(0xFFFAF7F2);
  static const primary = Color(0xFF5FA8A7);
  static const rose = Color(0xFFDC9B9B);
  static const roseLight = Color(0xFFF8E6E6);
  static const tealLight = Color(0xFFE5F2F1);
  static const warmLight = Color(0xFFFFE7C2);
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
            SizedBox(height: 20),
            _NotificationCard(
              icon: Icons.warning_amber_rounded,
              iconColor: Color(0xFFE05252),
              iconBg: Color(0xFFFFE0E0),
              dotColor: Color(0xFFE05252),
              title: 'Screen Time Alert',
              message:
                  'Emma has reached 80% of her daily screen time limit.',
              childName: 'Emma',
              time: '5h ago',
            ),
            SizedBox(height: 14),
            _NotificationCard(
              icon: Icons.check_circle_outline_rounded,
              iconColor: primary,
              iconBg: tealLight,
              dotColor: primary,
              title: 'Task Completed',
              message:
                  "Lucas completed 'Clean bedroom' and earned 10 points.",
              childName: 'Lucas',
              time: '5h ago',
            ),
            SizedBox(height: 14),
            _NotificationCard(
              icon: Icons.access_time_rounded,
              iconColor: Color(0xFFD18A45),
              iconBg: warmLight,
              dotColor: Color(0xFFD18A45),
              title: 'New Activity Detected',
              message:
                  'Emma opened a new app: Drawing Pad. Review if needed.',
              childName: 'Emma',
              time: '5h ago',
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
      children: const [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 28,
                  color: NotificationsScreen.textDark,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '3 unread',
                style: TextStyle(
                  fontSize: 16,
                  color: NotificationsScreen.textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Text(
          'Mark all read',
          style: TextStyle(
            fontSize: 15,
            color: NotificationsScreen.rose,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final Color dotColor;
  final String title;
  final String message;
  final String childName;
  final String time;

  const _NotificationCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.dotColor,
    required this.title,
    required this.message,
    required this.childName,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: NotificationsScreen.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 27,
                ),
              ),
              Positioned(
                top: -3,
                right: -3,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          color: NotificationsScreen.textDark,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 13,
                        color: NotificationsScreen.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 15,
                    color: NotificationsScreen.textMuted,
                    height: 1.45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: NotificationsScreen.roseLight,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    childName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: NotificationsScreen.rose,
                      fontWeight: FontWeight.w900,
                    ),
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