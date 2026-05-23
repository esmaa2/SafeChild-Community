import 'package:flutter/material.dart';

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({super.key});

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
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 100),
          children: const [
            _HomeHeader(),
            SizedBox(height: 16),
            _QuickMetricsGrid(),
            SizedBox(height: 22),
            _ChildrenSection(),
            SizedBox(height: 22),
            _RecentActivitySection(),
          ],
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
      decoration: BoxDecoration(
        color: ParentHomeScreen.roseLight,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        fontSize: 14,
                        color: ParentHomeScreen.textMuted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Esma 👋',
                      style: TextStyle(
                        fontSize: 22,
                        color: ParentHomeScreen.textDark,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              _HeaderIcon(
                icon: Icons.notifications_none_rounded,
                badge: '3',
              ),
              SizedBox(width: 10),
              _HeaderIcon(icon: Icons.settings_rounded),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: ParentHomeScreen.border),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.025),
                  blurRadius: 12,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Family Safety Score',
                  style: TextStyle(
                    fontSize: 14,
                    color: ParentHomeScreen.textMuted,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: '92',
                          style: TextStyle(
                            fontSize: 30,
                            color: ParentHomeScreen.textDark,
                            fontWeight: FontWeight.w900,
                          ),
                          children: [
                            TextSpan(
                              text: '/100',
                              style: TextStyle(
                                fontSize: 18,
                                color: ParentHomeScreen.textMuted,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: ParentHomeScreen.tealLight,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.trending_up_rounded,
                            size: 16,
                            color: ParentHomeScreen.primary,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '+5%',
                            style: TextStyle(
                              color: ParentHomeScreen.primary,
                              fontWeight: FontWeight.w800,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: const LinearProgressIndicator(
                    value: 0.92,
                    minHeight: 7,
                    backgroundColor: Color(0xFFE9E2DF),
                    color: ParentHomeScreen.rose,
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

class _HeaderIcon extends StatelessWidget {
  final IconData icon;
  final String? badge;

  const _HeaderIcon({
    required this.icon,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: ParentHomeScreen.rose,
            size: 23,
          ),
        ),
        if (badge != null)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              height: 18,
              width: 18,
              decoration: const BoxDecoration(
                color: ParentHomeScreen.primary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  badge!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _QuickMetricsGrid extends StatelessWidget {
  const _QuickMetricsGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.22,
      children: const [
        _MetricCard(
          icon: Icons.access_time_rounded,
          iconColor: ParentHomeScreen.primary,
          iconBg: ParentHomeScreen.tealLight,
          value: '2h 45m',
          label: 'Screen Time',
        ),
        _MetricCard(
          icon: Icons.menu_book_rounded,
          iconColor: ParentHomeScreen.rose,
          iconBg: ParentHomeScreen.roseLight,
          value: '4 tasks',
          label: 'Learning',
        ),
        _MetricCard(
          icon: Icons.checklist_rounded,
          iconColor: Color(0xFFD18A45),
          iconBg: ParentHomeScreen.warmLight,
          value: '3/5',
          label: 'Chores Done',
        ),
        _MetricCard(
          icon: Icons.build_circle_outlined,
          iconColor: Color(0xFF8A5A44),
          iconBg: Color(0xFFF6D7B8),
          value: '6 tools',
          label: 'Active Tools',
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String value;
  final String label;

  const _MetricCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ParentHomeScreen.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.018),
            blurRadius: 9,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              color: ParentHomeScreen.textDark,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: ParentHomeScreen.textMuted,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChildrenSection extends StatelessWidget {
  const _ChildrenSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _SectionHeader(title: 'My Children', action: '+ Add'),
        SizedBox(height: 10),
        _ChildCard(
          name: 'Emma',
          initial: 'E',
          time: '85m today',
          avatarBg: ParentHomeScreen.roseLight,
          avatarColor: ParentHomeScreen.rose,
        ),
        SizedBox(height: 10),
        _ChildCard(
          name: 'Lucas',
          initial: 'L',
          time: '42m today',
          avatarBg: ParentHomeScreen.tealLight,
          avatarColor: ParentHomeScreen.primary,
        ),
      ],
    );
  }
}

class _ChildCard extends StatelessWidget {
  final String name;
  final String initial;
  final String time;
  final Color avatarBg;
  final Color avatarColor;

  const _ChildCard({
    required this.name,
    required this.initial,
    required this.time,
    required this.avatarBg,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ParentHomeScreen.border),
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: avatarBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                initial,
                style: TextStyle(
                  fontSize: 18,
                  color: avatarColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 17,
                    color: ParentHomeScreen.textDark,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: ParentHomeScreen.textMuted,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 13,
                        color: ParentHomeScreen.textMuted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.shield_outlined,
                      size: 14,
                      color: ParentHomeScreen.primary,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Safe',
                      style: TextStyle(
                        fontSize: 13,
                        color: ParentHomeScreen.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: ParentHomeScreen.textMuted,
            size: 24,
          ),
        ],
      ),
    );
  }
}

class _RecentActivitySection extends StatelessWidget {
  const _RecentActivitySection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _SectionHeader(title: 'Recent Activity', action: 'View All'),
        SizedBox(height: 10),
        _ActivityCard(
          initial: 'E',
          title: 'Completed homework task',
          subtitle: 'Emma · 15 min ago',
          avatarBg: ParentHomeScreen.roseLight,
          avatarColor: ParentHomeScreen.rose,
        ),
        SizedBox(height: 9),
        _ActivityCard(
          initial: 'L',
          title: 'Screen time limit reached',
          subtitle: 'Lucas · 1 hour ago',
          avatarBg: ParentHomeScreen.tealLight,
          avatarColor: ParentHomeScreen.primary,
        ),
        SizedBox(height: 9),
        _ActivityCard(
          initial: 'E',
          title: 'Started reading session',
          subtitle: 'Emma · 2 hours ago',
          avatarBg: ParentHomeScreen.roseLight,
          avatarColor: ParentHomeScreen.rose,
        ),
      ],
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final String initial;
  final String title;
  final String subtitle;
  final Color avatarBg;
  final Color avatarColor;

  const _ActivityCard({
    required this.initial,
    required this.title,
    required this.subtitle,
    required this.avatarBg,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: ParentHomeScreen.border),
      ),
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: avatarBg,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Center(
              child: Text(
                initial,
                style: TextStyle(
                  fontSize: 17,
                  color: avatarColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: ParentHomeScreen.textDark,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ParentHomeScreen.textMuted,
                    fontWeight: FontWeight.w600,
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

class _SectionHeader extends StatelessWidget {
  final String title;
  final String action;

  const _SectionHeader({
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              color: ParentHomeScreen.textDark,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Text(
          action,
          style: const TextStyle(
            fontSize: 14,
            color: ParentHomeScreen.rose,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}