import 'package:fitness/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'dart:math';

class ProgressButton extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final PageController pageController;

  const ProgressButton({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ProgressPainter(progress: (currentPage + 1) / totalPages),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Center(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              gradient: AppColors.blueLinear,
            ),
            child: Center(
              child: IconButton(
                icon: Icon(IconlyLight.arrow_right_2),
                onPressed: () {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw the full circle border
    final paint =
        Paint()
          ..color = Color(0xFFF7F8F8)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.5;

    canvas.drawCircle(center, radius, paint);

    // Draw the progress arc
    final progressPaint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..shader = AppColors.blueLinear.createShader(
            Rect.fromCircle(center: center, radius: radius),
          );

    final startAngle = -pi / 2; // Start from top center
    final sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint on every progress change
  }
}
