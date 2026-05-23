import 'package:flutter/material.dart';
import 'choose_role_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<OnboardingItem> pages = [
    OnboardingItem(
      title: "Welcome to SafeChild",
      subtitle:
          "A safe digital space where parents protect, guide, and support their children with confidence.",
      imagePath: "assets/images/logo.png",
      icon: Icons.shield_outlined,
      isLogoPage: true,
    ),
    OnboardingItem(
      title: "Keep Your Children Safe",
      subtitle:
          "Monitor and control your child's digital experience with powerful, easy-to-use parental controls.",
      imagePath: "assets/images/step_one.png",
      icon: Icons.shield_outlined,
    ),
    OnboardingItem(
      title: "Stay Informed Always",
      subtitle:
          "Get real-time insights into your child's online activity, screen time, and learning progress.",
      imagePath: "assets/images/step_two.png",
      icon: Icons.visibility_outlined,
    ),
    OnboardingItem(
      title: "Guide Their Growth",
      subtitle:
          "Assign tasks, track learning milestones, and reward positive behavior to encourage development.",
      imagePath: "assets/images/step_three.png",
      icon: Icons.checklist_rounded,
    ),
  ];

  bool get isLastPage => currentPage == pages.length - 1;

  void nextPage() {
    if (!isLastPage) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      goToChooseRole();
    }
  }

  void goToChooseRole() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ChooseRoleScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
 const primary = Color(0xFF5FA8A7);
const buttonColor = Color(0xFFDC9B9B);
const accentSoft = Color(0xFFF8E6E6);
const textDark = Color(0xFF2A2A2A);
const textMuted = Color(0xFF7A6F73);
const background = Color(0xFFFAF7F2);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() => currentPage = index);
              },
              itemBuilder: (_, index) {
                final page = pages[index];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 46),

                      /// Image / Logo
                      Container(
                        width: double.infinity,
                        height: page.isLogoPage ? 250 : 280,
                        alignment: Alignment.center,
                        child: page.isLogoPage
                            ? Image.asset(
                                page.imagePath,
                                width: 190,
                                fit: BoxFit.contain,
                              )
                            : Container(
                                width: 260,
                                height: 260,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.12),
                                      blurRadius: 22,
                                      offset: const Offset(0, 12),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(32),
                                  child: Image.asset(
                                    page.imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),

                      const SizedBox(height: 48),

                      /// Icon
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: primary.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Icon(
                          page.icon,
                          color: primary,
                          size: 34,
                        ),
                      ),

                      const SizedBox(height: 34),

                      Text(
                        page.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          height: 1.15,
                          fontWeight: FontWeight.w800,
                          color: textDark,
                        ),
                      ),

                      const SizedBox(height: 18),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          page.subtitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 19,
                            height: 1.55,
                            fontWeight: FontWeight.w400,
                            color: textMuted,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      _DotsIndicator(
                        currentPage: currentPage,
                        totalPages: pages.length,
                      ),

                      const Spacer(),

                      SizedBox(
                        width: double.infinity,
                        height: 64,
                        child: ElevatedButton(
                          onPressed: nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            foregroundColor: Colors.white,
                            elevation: 8,
                            shadowColor: buttonColor.withOpacity(0.20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                isLastPage ? "Get Started" : "Next",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              if (!isLastPage) ...[
                                const SizedBox(width: 14),
                                const Icon(Icons.arrow_forward_ios_rounded,
                                    size: 20),
                              ],
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                );
              },
            ),

            /// Skip
            Positioned(
              top: 24,
              right: 34,
              child: TextButton(
                onPressed: goToChooseRole,
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: textMuted,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String subtitle;
  final String imagePath;
  final IconData icon;
  final bool isLogoPage;

  OnboardingItem({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.icon,
    this.isLogoPage = false,
  });
}

class _DotsIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const _DotsIndicator({
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFFDC9B9B);
    const inactiveColor = Color(0xFFE7EDF6);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: currentPage == index ? 34 : 11,
          height: 10,
          decoration: BoxDecoration(
            color: currentPage == index ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}