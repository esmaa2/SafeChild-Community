import 'package:flutter/material.dart';
import 'package:safechild/screens/parent/parent_login_screen.dart';
import 'package:safechild/screens/parent/parent_signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const background = Color(0xFFFAF7F2);
  static const primary = Color(0xFF5FA8A7);
  static const rose = Color(0xFFDC9B9B);
  static const roseLight = Color(0xFFF8E6E6);
  static const textDark = Color(0xFF2A2A2A);
  static const textMuted = Color(0xFF7A6F73);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
          child: Column(
            children: [
              const Spacer(),

              Image.asset(
                'assets/images/logo.png',
                height: 80,
              ),

              const SizedBox(height: 34),

              Container(
                height: 76,
                width: 76,
                decoration: BoxDecoration(
                  color: roseLight,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.shield_outlined,
                  color: rose,
                  size: 38,
                ),
              ),

              const SizedBox(height: 34),

              const Text(
                "Parent Access",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  height: 1.1,
                  fontWeight: FontWeight.w800,
                  color: textDark,
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                "Create your parent account or log in to continue setting up your family on SafeChild.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: textMuted,
                  height: 1.55,
                ),
              ),

              const SizedBox(height: 22),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: roseLight,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Children can only access the app after being added by a parent.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF8A5A5A),
                    height: 1.45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 62,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ParentSignupScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: rose,
                    foregroundColor: Colors.white,
                    elevation: 6,
                    shadowColor: rose.withOpacity(0.18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: const Text(
                    "Create Parent Account",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 62,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ParentLoginScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: primary,
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      color: primary,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 16,
                    color: textMuted,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}