import 'package:flutter/material.dart';
import 'kid_main_shell.dart';

class KidLoginScreen extends StatefulWidget {
  const KidLoginScreen({super.key});

  @override
  State<KidLoginScreen> createState() => _KidLoginScreenState();
}

class _KidLoginScreenState extends State<KidLoginScreen> {
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _loginKid() {
    if (_codeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your secret code")),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const KidMainShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEAF4FF),
              Color(0xFFD8FFF0),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 135,
                        width: 135,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF3E72F2), Color(0xFF17B7E8)],
                          ),
                          borderRadius: BorderRadius.circular(34),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF3E72F2).withOpacity(0.25),
                              blurRadius: 25,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text("🛡️", style: TextStyle(fontSize: 62)),
                        ),
                      ),
                      const Positioned(
                        right: -16,
                        top: -18,
                        child: Text("⭐", style: TextStyle(fontSize: 38)),
                      ),
                      const Positioned(
                        left: -22,
                        bottom: 8,
                        child: Text("✨", style: TextStyle(fontSize: 28)),
                      ),
                    ],
                  ),

                  const SizedBox(height: 38),

                  const Text(
                    "Hey there! 👋",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      height: 1.1,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF112B55),
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    "Enter the code your parent gave you to get started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6B7F9E),
                    ),
                  ),

                  const SizedBox(height: 46),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(26),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Your secret code 🤫",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF112B55),
                          ),
                        ),

                        const SizedBox(height: 24),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 7),
                              height: 62,
                              width: 62,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7F9FD),
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                  color: const Color(0xFFDDE6F3),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 28),

                        TextField(
                          controller: _codeController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF112B55),
                          ),
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: "Type your code here",
                            hintStyle: const TextStyle(
                              color: Color(0xFF6B7F9E),
                              fontWeight: FontWeight.w500,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8FAFE),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: const BorderSide(
                                color: Color(0xFFDDE6F3),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: const BorderSide(
                                color: Color(0xFF3E72F2),
                                width: 2,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 22),

                        SizedBox(
                          width: double.infinity,
                          height: 64,
                          child: ElevatedButton(
                            onPressed: _loginKid,
                            style: ElevatedButton.styleFrom(
                              elevation: 8,
                              shadowColor:
                                  const Color(0xFF3E72F2).withOpacity(0.35),
                              backgroundColor: const Color(0xFF2196F3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                            child: const Text(
                              "Let's Go! 🚀  →",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 36),

                  const Text(
                    "No code yet? Ask your parent to set one up for you 😊",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF7B91AE),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}