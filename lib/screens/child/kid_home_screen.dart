import 'package:flutter/material.dart';

class KidHomeScreen extends StatelessWidget {
  const KidHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7E8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              KidHeader(),
              SizedBox(height: 20),
              KidMissionCard(),
              SizedBox(height: 22),
              Text(
                "Choose your adventure 🚀",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF17315E),
                ),
              ),
              SizedBox(height: 16),
              KidActionGrid(),
              SizedBox(height: 24),
              Text(
                "More fun ✨",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF17315E),
                ),
              ),
              SizedBox(height: 14),
              MoreFunTile(
                emoji: "📰",
                title: "Safe Feed",
                subtitle: "See fun posts made for kids",
                color: Color(0xFFE8F0FF),
              ),
              SizedBox(height: 12),
              MoreFunTile(
                emoji: "💬",
                title: "Messages",
                subtitle: "Chat with approved friends",
                color: Color(0xFFFFEAF3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KidHeader extends StatelessWidget {
  const KidHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFE9A8), Color(0xFFFFC7E1)],
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Center(
              child: Text("👧", style: TextStyle(fontSize: 42)),
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi Emma 👋",
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF17315E),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Ready to have fun today?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B5870),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFF9F1C),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Row(
              children: [
                Icon(Icons.star_rounded, color: Colors.white, size: 22),
                SizedBox(width: 4),
                Text(
                  "320",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
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

class KidMissionCard extends StatelessWidget {
  const KidMissionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5B7CFA), Color(0xFF22C1DC)],
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "⚡ Today’s Mission",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Finish 2 math lessons",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 6),
          Text(
            "Win +50 bonus stars 🌟",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class KidActionGrid extends StatelessWidget {
  const KidActionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 0.95,
      children: const [
        KidActionCard(
          emoji: "📚",
          title: "Learn",
          subtitle: "3 lessons",
          color: Color(0xFF5B8CFF),
        ),
        KidActionCard(
          emoji: "✅",
          title: "Tasks",
          subtitle: "2 to do",
          color: Color(0xFF9B5CFF),
        ),
        KidActionCard(
          emoji: "🏆",
          title: "Rewards",
          subtitle: "Get prizes",
          color: Color(0xFFFFB703),
        ),
        KidActionCard(
          emoji: "🎨",
          title: "My Space",
          subtitle: "Profile",
          color: Color(0xFF20C997),
        ),
      ],
    );
  }
}

class KidActionCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final Color color;

  const KidActionCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(34),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -8,
            top: -8,
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.22),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 42)),
              const Spacer(),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MoreFunTile extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final Color color;

  const MoreFunTile({
    super.key,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 36)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF17315E),
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xFF17315E),
            size: 18,
          ),
        ],
      ),
    );
  }
}


