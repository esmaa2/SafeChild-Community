import 'package:flutter/material.dart';

class KidProfileScreen extends StatelessWidget {
  const KidProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9FFF2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "My Profile 😊",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF112B55),
                ),
              ),
              SizedBox(height: 24),

              ProfileCard(),
              SizedBox(height: 22),

              ProfileStatsGrid(),
              SizedBox(height: 22),

              LevelCard(),
              SizedBox(height: 22),

              ProfileMenu(),
              SizedBox(height: 22),

              SwitchAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(34),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 128,
                width: 128,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3E72F2), Color(0xFF17B7E8)],
                  ),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const Center(
                  child: Text(
                    "E",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 56,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const Positioned(
                right: -18,
                top: -18,
                child: Text("⭐", style: TextStyle(fontSize: 38)),
              ),
            ],
          ),
          const SizedBox(height: 22),
          const Text(
            "Emma",
            style: TextStyle(
              color: Color(0xFF112B55),
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Age 10 · 5th Grade",
            style: TextStyle(
              color: Color(0xFF64748B),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFD4FBE5),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Text(
              "🛡️ SafeChild Verified ✅",
              style: TextStyle(
                color: Color(0xFF059669),
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileStatsGrid extends StatelessWidget {
  const ProfileStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 1.15,
      children: const [
        ProfileStatCard(
          emoji: "⭐",
          value: "320",
          label: "Points",
          bg: Color(0xFFFFF1A8),
          valueColor: Color(0xFFE87900),
        ),
        ProfileStatCard(
          emoji: "🔥",
          value: "5 days",
          label: "Streak",
          bg: Color(0xFFFFDEC0),
          valueColor: Color(0xFFEA580C),
        ),
        ProfileStatCard(
          emoji: "✅",
          value: "8",
          label: "Tasks Done",
          bg: Color(0xFFBFF7D8),
          valueColor: Color(0xFF059669),
        ),
        ProfileStatCard(
          emoji: "📖",
          value: "16",
          label: "Lessons",
          bg: Color(0xFFE5DBFF),
          valueColor: Color(0xFF7C3AED),
        ),
      ],
    );
  }
}

class ProfileStatCard extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;
  final Color bg;
  final Color valueColor;

  const ProfileStatCard({
    super.key,
    required this.emoji,
    required this.value,
    required this.label,
    required this.bg,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const Spacer(),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: valueColor,
              fontSize: 27,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class LevelCard extends StatelessWidget {
  const LevelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3E72F2), Color(0xFF17B7E8)],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "🏅 Current Level",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Level 5 — Explorer 🚀",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            "180 pts to Level 6",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const LinearProgressIndicator(
              value: 0.64,
              minHeight: 12,
              backgroundColor: Colors.white30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFDDE6F3)),
      ),
      child: const Column(
        children: [
          ProfileMenuItem(
            emoji: "❔",
            title: "Help & Safety Tips",
            bg: Color(0xFFEAF1FF),
          ),
          Divider(height: 1, color: Color(0xFFE5ECF5)),
          ProfileMenuItem(
            emoji: "🛡️",
            title: "About SafeChild",
            bg: Color(0xFFD4FBE5),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String emoji;
  final String title;
  final Color bg;

  const ProfileMenuItem({
    super.key,
    required this.emoji,
    required this.title,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(emoji, style: const TextStyle(fontSize: 22)),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF112B55),
          fontSize: 18,
          fontWeight: FontWeight.w900,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Color(0xFF64748B),
        size: 18,
      ),
    );
  }
}

class SwitchAccountButton extends StatelessWidget {
  const SwitchAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFFEFF4FA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: const Text(
          "Switch Account 👋",
          style: TextStyle(
            color: Color(0xFF64748B),
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}