import 'package:flutter/material.dart';
import 'package:safechild/screens/shared/welcome_screen.dart';
import 'package:safechild/screens/child/kid_home_screen.dart';
import 'package:safechild/screens/child/kid_login_screen.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  static const background = Color(0xFFFAF7F2);
  static const primary = Color(0xFF5FA8A7);
  static const rose = Color(0xFFDC9B9B);
  static const roseLight = Color(0xFFF8E6E6);
  static const tealLight = Color(0xFFE5F2F1);
  static const textDark = Color(0xFF2A2A2A);
  static const textMuted = Color(0xFF7A6F73);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: goBack,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                      color: Color(0xFF1F2937),
                    ),
                  ),

                  const SizedBox(height: 52),

                  const Text(
                    'Who are you?',
                    style: TextStyle(
                      fontSize: 42,
                      height: 1.05,
                      fontWeight: FontWeight.w800,
                      color: textDark,
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'Choose your role to set up the right experience',
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.45,
                      fontWeight: FontWeight.w400,
                      color: textMuted,
                    ),
                  ),

                  const SizedBox(height: 56),

                  _roleCard(
                    title: "I'm a Parent",
                    subtitle: "Manage and monitor your children's digital safety",
                    icon: Icons.shield_outlined,
                    borderColor: rose,
                    iconBg: roseLight,
                    iconColor: rose,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const WelcomeScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 28),

                  _roleCard(
                    title: "I'm a Child",
                    subtitle: "Access your safe digital space managed by your parents",
                    icon: Icons.child_care_rounded,
                    borderColor: primary,
                    iconBg: tealLight,
                    iconColor: primary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const KidLoginScreen(),
                        ),
                      );
                    },
                  ),

                  const Spacer(),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.45,
                            color: textMuted,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(text: 'By continuing, you agree to our '),
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(
                                color: rose,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(text: ' and\n'),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: rose,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _roleCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color borderColor,
    required Color iconBg,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 26),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.62),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: borderColor,
            width: 2.8,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 82,
              width: 82,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Icon(
                icon,
                size: 42,
                color: iconColor,
              ),
            ),

            const SizedBox(width: 24),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 27,
                      height: 1.1,
                      fontWeight: FontWeight.w800,
                      color: textDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.35,
                      fontWeight: FontWeight.w400,
                      color: textMuted,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}