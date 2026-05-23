import 'package:flutter/material.dart';

class KidLearnScreen extends StatefulWidget {
  const KidLearnScreen({super.key});

  @override
  State<KidLearnScreen> createState() => _KidLearnScreenState();
}

class _KidLearnScreenState extends State<KidLearnScreen> {
  bool showRecent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's Learn! 🚀",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1C2E4A),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "You're doing amazing today",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF7A8CA8),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),

              const Row(
                children: [
                  Expanded(
                    child: StatCard(
                      emoji: "🔥",
                      value: "5 days",
                      label: "Streak",
                      color: Color(0xFFFFE9A8),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: StatCard(
                      emoji: "⭐",
                      value: "320",
                      label: "Points",
                      color: Color(0xFFE6ECF7),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: StatCard(
                      emoji: "📖",
                      value: "16 done",
                      label: "Lessons",
                      color: Color(0xFFD8F3E3),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const GoalCard(),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: LearnTabButton(
                      text: "📚 My Courses",
                      active: !showRecent,
                      onTap: () => setState(() => showRecent = false),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: LearnTabButton(
                      text: "⏱ Recent",
                      active: showRecent,
                      onTap: () => setState(() => showRecent = true),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              if (!showRecent) ...[
                const CourseCard(
                  emoji: "🔢",
                  title: "Fractions Fun",
                  subject: "Mathematics",
                  progress: 0.7,
                  lessons: "7/10 lessons",
                  color1: Color(0xFF4A7CF3),
                  color2: Color(0xFF6E9CFF),
                ),
                const SizedBox(height: 16),
                const CourseCard(
                  emoji: "🪐",
                  title: "Space Explorer",
                  subject: "Science",
                  progress: 0.4,
                  lessons: "3/8 lessons",
                  color1: Color(0xFF1DA1F2),
                  color2: Color(0xFF4FC3F7),
                ),
                const SizedBox(height: 16),
                const CourseCard(
                  emoji: "✍️",
                  title: "Story Magic",
                  subject: "English",
                  progress: 0.9,
                  lessons: "5/6 lessons",
                  color1: Color(0xFF10B981),
                  color2: Color(0xFF34D399),
                ),
                const SizedBox(height: 16),
                const CourseCard(
                  emoji: "🏛",
                  title: "Ancient Egypt",
                  subject: "History",
                  progress: 0.1,
                  lessons: "1/12 lessons",
                  color1: Color(0xFFF59E0B),
                  color2: Color(0xFFFFD166),
                ),
              ] else ...[
                const RecentLessonTile(
                  emoji: "✅",
                  title: "Adding Fractions",
                  subject: "Math",
                  points: "20",
                ),
                const SizedBox(height: 14),
                const RecentLessonTile(
                  emoji: "🌙",
                  title: "The Moon & Tides",
                  subject: "Science",
                  points: "15",
                ),
                const SizedBox(height: 14),
                const RecentLessonTile(
                  emoji: "📖",
                  title: "Story Starters",
                  subject: "English",
                  points: "25",
                ),
                const SizedBox(height: 14),
                const RecentLessonTile(
                  emoji: "🎨",
                  title: "Color Shapes",
                  subject: "Art",
                  points: "10",
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class LearnTabButton extends StatelessWidget {
  final String text;
  final bool active;
  final VoidCallback onTap;

  const LearnTabButton({
    super.key,
    required this.text,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF3E72F2) : Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xFFDDE6F3)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : const Color(0xFF7A8CA8),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

class GoalCard extends StatelessWidget {
  const GoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3E72F2), Color(0xFF17B7E8)],
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "⚡ Today's Goal",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "2 of 3 lessons done!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const LinearProgressIndicator(
              value: 0.66,
              minHeight: 10,
              backgroundColor: Colors.white24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;
  final Color color;

  const StatCard({
    super.key,
    required this.emoji,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6B7F9E),
            ),
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String subject;
  final double progress;
  final String lessons;
  final Color color1;
  final Color color2;

  const CourseCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.subject,
    required this.progress,
    required this.lessons,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [color1, color2]),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(28),
              ),
            ),
            child: Row(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      subject,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      lessons,
                      style: const TextStyle(color: Color(0xFF6B7F9E)),
                    ),
                    const Spacer(),
                    Text(
                      "${(progress * 100).toInt()}%",
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1C2E4A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: const Color(0xFFE6ECF7),
                    color: color1,
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: color1.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "▶ Keep Going!",
                      style: TextStyle(
                        color: color1,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RecentLessonTile extends StatelessWidget {
  final String emoji;
  final String title;
  final String subject;
  final String points;

  const RecentLessonTile({
    super.key,
    required this.emoji,
    required this.title,
    required this.subject,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: const Color(0xFFDDE6F3)),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 34)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF112B55),
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  subject,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF1C2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "⭐ $points",
              style: const TextStyle(
                color: Color(0xFFD97706),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}