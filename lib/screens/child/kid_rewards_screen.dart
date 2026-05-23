import 'package:flutter/material.dart';

class KidRewardsScreen extends StatelessWidget {
  const KidRewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7E8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "My Rewards 🏅",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF112B55),
                ),
              ),
              SizedBox(height: 6),
              Text(
                "Keep earning — amazing things await!",
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFFB87955),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 24),

              TotalPointsCard(),
              SizedBox(height: 28),

              Text(
                "My Badges 🎖️",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF112B55),
                ),
              ),
              SizedBox(height: 16),

              BadgeGrid(),
              SizedBox(height: 28),

              Text(
                "Reward Goals 🎯",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF112B55),
                ),
              ),
              SizedBox(height: 16),

              RewardGoalTile(
                emoji: "⏱️",
                title: "Extra 15 min screen time",
                points: "100 points needed",
                unlocked: true,
              ),
              SizedBox(height: 14),
              RewardGoalTile(
                emoji: "🎬",
                title: "Pick the weekend movie",
                points: "250 points needed",
                unlocked: true,
              ),
              SizedBox(height: 14),
              RewardGoalTile(
                emoji: "🎉",
                title: "Special family outing",
                points: "500 points needed",
              ),
              SizedBox(height: 14),
              RewardGoalTile(
                emoji: "🎁",
                title: "Big mystery reward!",
                points: "1000 points needed",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TotalPointsCard extends StatelessWidget {
  const TotalPointsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE87900), Color(0xFFFFA300)],
        ),
        borderRadius: BorderRadius.circular(34),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFA300).withOpacity(0.25),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text("🌟", style: TextStyle(fontSize: 48)),
          const SizedBox(height: 8),
          const Text(
            "Total Points",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Text(
            "320",
            style: TextStyle(
              color: Colors.white,
              fontSize: 74,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "180 pts to next reward 🎁",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
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

class BadgeGrid extends StatelessWidget {
  const BadgeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 12,
      childAspectRatio: 0.9,
      children: const [
        BadgeCard(emoji: "🔥", title: "5-Day Streak", earned: true),
        BadgeCard(emoji: "📚", title: "Bookworm", earned: true),
        BadgeCard(emoji: "🧹", title: "Super Helper", earned: true),
        BadgeCard(emoji: "🏆", title: "Top Learner"),
        BadgeCard(emoji: "⭐", title: "Star Student"),
        BadgeCard(emoji: "🚀", title: "Level 10"),
      ],
    );
  }
}

class BadgeCard extends StatelessWidget {
  final String emoji;
  final String title;
  final bool earned;

  const BadgeCard({
    super.key,
    required this.emoji,
    required this.title,
    this.earned = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: earned ? const Color(0xFFFFC83D) : const Color(0xFFF0F0F0),
          width: earned ? 3 : 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: earned ? 1 : 0.35,
            child: Text(emoji, style: const TextStyle(fontSize: 36)),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: Color(0xFF112B55),
            ),
          ),
          if (earned) ...[
            const SizedBox(height: 4),
            const Text(
              "Earned! ✨",
              style: TextStyle(
                color: Color(0xFFE87900),
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class RewardGoalTile extends StatelessWidget {
  final String emoji;
  final String title;
  final String points;
  final bool unlocked;

  const RewardGoalTile({
    super.key,
    required this.emoji,
    required this.title,
    required this.points,
    this.unlocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: unlocked ? const Color(0xFFD4FBE5) : Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: unlocked ? const Color(0xFF8EF0B8) : const Color(0xFFDDE6F3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: unlocked ? const Color(0xFFBFF7D8) : const Color(0xFFF7F9FD),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: Text(emoji, style: const TextStyle(fontSize: 30)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: unlocked
                        ? const Color(0xFF059669)
                        : const Color(0xFF112B55),
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  points,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: unlocked ? Colors.white : const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              unlocked ? "Done! 🎉" : "Locked 🔒",
              style: TextStyle(
                color: unlocked
                    ? const Color(0xFF059669)
                    : const Color(0xFF64748B),
                fontWeight: FontWeight.w900,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}