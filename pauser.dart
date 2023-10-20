import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RingPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;

  RingPainter({required this.strokeWidth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - strokeWidth / 2;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Pauser extends ConsumerWidget {
  const Pauser({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: CustomPaint(
        painter: RingPainter(strokeWidth: 2, color: Colors.white),
        child: IconButton(
          color: Colors.white,
          iconSize: 50,
          onPressed: () {},
          icon: const Icon(Icons.pause),
        ),
      ),
    );
  }
}