import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

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
            _CategoryTabs(),
            SizedBox(height: 18),
            _FeedPostCard(
              initial: 'S',
              name: 'Sarah Johnson',
              date: 'May 3',
              tag: 'tip',
              tagColor: primary,
              tagBg: tealLight,
              content:
                  'Just discovered that setting a consistent screen time schedule really helped my 8-year-old become more self-disciplined. Sharing in case it helps other parents!',
              likes: '24',
              comments: '8',
            ),
            SizedBox(height: 16),
            _FeedPostCard(
              initial: 'M',
              name: 'Michael Chen',
              date: 'May 3',
              tag: 'question',
              tagColor: rose,
              tagBg: roseLight,
              content:
                  'What are the best educational apps for a 6-year-old? Looking for something that makes learning fun without too much screen dependency.',
              likes: '15',
              comments: '12',
            ),
            SizedBox(height: 16),
            _PollCard(),
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
                'Community',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: PostScreen.textDark,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Parent discussions & tips',
                style: TextStyle(
                  fontSize: 16,
                  color: PostScreen.textMuted,
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
            color: PostScreen.rose,
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

class _CategoryTabs extends StatelessWidget {
  const _CategoryTabs();

  @override
  Widget build(BuildContext context) {
    final tabs = ['All', 'Tips', 'Questions', 'Discuss'];

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFF2EDEA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: tabs.map((tab) {
          final selected = tab == 'All';

          return Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 11),
              decoration: BoxDecoration(
                color: selected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                tab,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: selected ? PostScreen.textDark : PostScreen.textMuted,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _FeedPostCard extends StatelessWidget {
  final String initial;
  final String name;
  final String date;
  final String tag;
  final Color tagColor;
  final Color tagBg;
  final String content;
  final String likes;
  final String comments;

  const _FeedPostCard({
    required this.initial,
    required this.name,
    required this.date,
    required this.tag,
    required this.tagColor,
    required this.tagBg,
    required this.content,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: PostScreen.border),
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
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: PostScreen.roseLight,
                child: Text(
                  initial,
                  style: const TextStyle(
                    color: PostScreen.rose,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: PostScreen.textDark,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      date,
                      style: const TextStyle(
                        color: PostScreen.textMuted,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: tagBg,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: tagColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            content,
            style: const TextStyle(
              color: PostScreen.textDark,
              fontSize: 18,
              height: 1.45,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 18),
          const Divider(color: PostScreen.border),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.favorite_border_rounded,
                  color: PostScreen.textMuted, size: 24),
              const SizedBox(width: 7),
              Text(
                likes,
                style: const TextStyle(
                  color: PostScreen.textMuted,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 24),
              const Icon(Icons.chat_bubble_outline_rounded,
                  color: PostScreen.textMuted, size: 23),
              const SizedBox(width: 7),
              Text(
                comments,
                style: const TextStyle(
                  color: PostScreen.textMuted,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 24),
              const Icon(Icons.bookmark_border_rounded,
                  color: PostScreen.textMuted, size: 24),
              const Spacer(),
              const Icon(Icons.share_outlined,
                  color: PostScreen.textMuted, size: 24),
            ],
          ),
        ],
      ),
    );
  }
}

class _PollCard extends StatelessWidget {
  const _PollCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: PostScreen.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              CircleAvatar(
                radius: 24,
                backgroundColor: PostScreen.tealLight,
                child: Text(
                  'A',
                  style: TextStyle(
                    color: PostScreen.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(width: 14),
              Expanded(
                child: Text(
                  'Weekly Parent Poll',
                  style: TextStyle(
                    color: PostScreen.textDark,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Icon(Icons.poll_outlined, color: PostScreen.rose),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'What is your biggest challenge with screen time?',
            style: TextStyle(
              color: PostScreen.textDark,
              fontSize: 18,
              height: 1.4,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          _pollOption('Setting limits', 0.62),
          SizedBox(height: 10),
          _pollOption('Choosing safe content', 0.48),
          SizedBox(height: 10),
          _pollOption('Balancing learning and fun', 0.35),
        ],
      ),
    );
  }

  static Widget _pollOption(String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: PostScreen.textMuted,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 9,
            color: PostScreen.rose,
            backgroundColor: PostScreen.roseLight,
          ),
        ),
      ],
    );
  }
}