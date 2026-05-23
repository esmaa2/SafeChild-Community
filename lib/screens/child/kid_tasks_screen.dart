import 'package:flutter/material.dart';

class KidTasksScreen extends StatelessWidget {
  const KidTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "My Tasks 🎯",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF112B55),
                ),
              ),
              SizedBox(height: 6),
              Text(
                "You're crushing it!",
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF8FA0BD),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 24),

              PointsCard(),
              SizedBox(height: 22),

              ProgressCard(),
              SizedBox(height: 22),

              TaskTile(
                emoji: "📝",
                title: "Complete math homework",
                status: "Done! 🎉",
                points: "20",
                done: true,
              ),
              SizedBox(height: 14),
              TaskTile(
                emoji: "🧹",
                title: "Clean your bedroom",
                status: "Waiting for parent ✋",
                points: "10",
                waiting: true,
              ),
              SizedBox(height: 14),
              TaskTile(
                emoji: "📖",
                title: "Read for 30 minutes",
                status: "To Do",
                points: "25",
              ),
              SizedBox(height: 14),
              TaskTile(
                emoji: "🦷",
                title: "Brush your teeth",
                status: "To Do",
                points: "5",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PointsCard extends StatelessWidget {
  const PointsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFFA78BFA)],
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: const Row(
        children: [
          Text("🏆", style: TextStyle(fontSize: 62)),
          SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Points Earned",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "20",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 52,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 8),
                  Padding(
                    padding: EdgeInsets.only(bottom: 9),
                    child: Text(
                      "pts",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: const Color(0xFFDDE6F3)),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "Today's progress",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF112B55),
                ),
              ),
              Spacer(),
              Text(
                "1/5 tasks ✅",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF7C3AED),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const LinearProgressIndicator(
              value: 0.2,
              minHeight: 14,
              backgroundColor: Color(0xFFEAF0F8),
              color: Color(0xFF8B5CF6),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final String emoji;
  final String title;
  final String status;
  final String points;
  final bool done;
  final bool waiting;

  const TaskTile({
    super.key,
    required this.emoji,
    required this.title,
    required this.status,
    required this.points,
    this.done = false,
    this.waiting = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color mainColor = done
        ? const Color(0xFF10B981)
        : waiting
            ? const Color(0xFFF59E0B)
            : const Color(0xFF7C3AED);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: const Color(0xFFDDE6F3)),
      ),
      child: Row(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFF7F9FD),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: Text(emoji, style: const TextStyle(fontSize: 34)),
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
                    decoration: done ? TextDecoration.lineThrough : null,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: done || waiting
                        ? const Color(0xFF64748B)
                        : const Color(0xFF112B55),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: mainColor.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF1C2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "⭐ $points",
                  style: const TextStyle(
                    color: Color(0xFFD97706),
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Icon(
                done
                    ? Icons.check_circle_outline_rounded
                    : waiting
                        ? Icons.timer_outlined
                        : Icons.play_circle_fill_rounded,
                color: mainColor,
                size: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}