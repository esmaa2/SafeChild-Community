import 'package:flutter/material.dart';

void showFinishProfileAlert(
  BuildContext context, {
  required VoidCallback onContinue,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 26),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: const Color(0xFFFAF7F2),
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: const Color(0xFFE4DAD6)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 58,
              width: 58,
              decoration: BoxDecoration(
                color: const Color(0xFFF8E6E6),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.person_add_alt_1_rounded,
                color: Color(0xFFDC9B9B),
                size: 30,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Finish setting up your profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Color(0xFF2A2A2A),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Complete your parent profile and add child details so SafeChild can personalize family safety controls.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                height: 1.45,
                fontWeight: FontWeight.w600,
                color: Color(0xFF7A6F73),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onContinue();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDC9B9B),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Continue Setup',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Skip for now',
                style: TextStyle(
                  color: Color(0xFF7A6F73),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}