import 'package:flutter/material.dart';

class ParentProfileScreen extends StatelessWidget {
  const ParentProfileScreen({super.key});

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
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: textDark,
              ),
            ),
            SizedBox(height: 18),
            _ProfileCard(),
            SizedBox(height: 18),
            _StatsRow(),
            SizedBox(height: 24),
            _SectionTitle('ACCOUNT'),
            SizedBox(height: 10),
            _MenuGroup(
              items: [
                _MenuItem(Icons.person_outline_rounded, 'Edit Profile', roseLight, rose),
                _MenuItem(Icons.notifications_none_rounded, 'Notification Settings', warmLight, Color(0xFFD18A45)),
                _MenuItem(Icons.lock_outline_rounded, 'Privacy & Security', roseLight, Color(0xFFE05252)),
                _MenuItem(Icons.credit_card_rounded, 'Subscription', tealLight, primary),
              ],
            ),
            SizedBox(height: 24),
            _SectionTitle('PREFERENCES'),
            SizedBox(height: 10),
            _MenuGroup(
              items: [
                _MenuItem(Icons.language_rounded, 'Language', tealLight, primary, trailingText: 'English'),
                _MenuItem(Icons.dark_mode_outlined, 'Dark Mode', roseLight, rose, isSwitch: true),
              ],
            ),
            SizedBox(height: 24),
            _SectionTitle('SUPPORT'),
            SizedBox(height: 10),
            _MenuGroup(
              items: [
                _MenuItem(Icons.help_outline_rounded, 'Help Center', roseLight, rose),
                _MenuItem(Icons.description_outlined, 'Terms & Privacy', Color(0xFFF7F3EF), textMuted),
                _MenuItem(Icons.shield_outlined, 'About SafeChild', tealLight, primary),
              ],
            ),
            SizedBox(height: 22),
            _LogoutButton(),
            SizedBox(height: 18),
            Center(
              child: Text(
                'SafeChild v2.1.0 · Made with care for parents',
                style: TextStyle(
                  fontSize: 13,
                  color: textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: ParentProfileScreen.border),
      ),
      child: Row(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              color: ParentProfileScreen.roseLight,
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Center(
              child: Text(
                'E',
                style: TextStyle(
                  fontSize: 32,
                  color: ParentProfileScreen.rose,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Esma',
                  style: TextStyle(
                    fontSize: 24,
                    color: ParentProfileScreen.textDark,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'tolbaasma0@gmail.com',
                  style: TextStyle(
                    fontSize: 15,
                    color: ParentProfileScreen.textMuted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      size: 16,
                      color: ParentProfileScreen.primary,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Premium Member',
                      style: TextStyle(
                        fontSize: 14,
                        color: ParentProfileScreen.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            decoration: BoxDecoration(
              color: ParentProfileScreen.roseLight,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Text(
              'Edit',
              style: TextStyle(
                color: ParentProfileScreen.rose,
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: _StatCard(value: '2', label: 'Children')),
        SizedBox(width: 12),
        Expanded(child: _StatCard(value: '12', label: 'Tasks Set')),
        SizedBox(width: 12),
        Expanded(child: _StatCard(value: '45', label: 'Days Active')),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ParentProfileScreen.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              color: ParentProfileScreen.textDark,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: ParentProfileScreen.textMuted,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        letterSpacing: 0.6,
        color: ParentProfileScreen.textMuted,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  final Color iconBg;
  final Color iconColor;
  final String? trailingText;
  final bool isSwitch;

  const _MenuItem(
    this.icon,
    this.title,
    this.iconBg,
    this.iconColor, {
    this.trailingText,
    this.isSwitch = false,
  });
}

class _MenuGroup extends StatelessWidget {
  final List<_MenuItem> items;

  const _MenuGroup({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: ParentProfileScreen.border),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Column(
            children: [
              _MenuTile(item: item),
              if (index != items.length - 1)
                const Divider(height: 1, color: ParentProfileScreen.border),
            ],
          );
        }),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final _MenuItem item;

  const _MenuTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: item.iconBg,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(item.icon, color: item.iconColor, size: 23),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              item.title,
              style: const TextStyle(
                fontSize: 17,
                color: ParentProfileScreen.textDark,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          if (item.trailingText != null)
            Text(
              item.trailingText!,
              style: const TextStyle(
                fontSize: 15,
                color: ParentProfileScreen.textMuted,
                fontWeight: FontWeight.w600,
              ),
            )
          else if (item.isSwitch)
            Container(
              width: 46,
              height: 26,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: const Color(0xFFE3DAD7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            )
          else
            const Icon(
              Icons.chevron_right_rounded,
              color: ParentProfileScreen.textMuted,
              size: 26,
            ),
        ],
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: const Color(0xFFFFEEEE),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout_rounded, color: Color(0xFFE05252)),
            SizedBox(width: 10),
            Text(
              'Sign Out',
              style: TextStyle(
                color: Color(0xFFE05252),
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}