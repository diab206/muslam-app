import 'dart:math';
import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _TasbihCounterState();
}

class _TasbihCounterState extends State<SebhaScreen> with SingleTickerProviderStateMixin {
  int count = 0;
  int phraseCount = 0;
  double rotation = 0.0;
  late AnimationController _controller;
  // ignore: unused_field
  late Animation<double> _animation;

  final List<String> dhikrPhrases = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String getCurrentPhrase() {
    if (phraseCount == 0) return dhikrPhrases[0];      // سبحان الله
    if (phraseCount == 1) return dhikrPhrases[1];      // الحمد لله
    if (phraseCount == 2) return dhikrPhrases[2];      // الله اكبر
    return dhikrPhrases[0];
  }

  void _handleTap() {
    setState(() {
      count++;
      
      // Handle phrase transitions
      if (phraseCount == 0 && count == 33) {
        // Transition from سبحان الله to الحمد لله
        phraseCount = 1;
        count = 0;
      } else if (phraseCount == 1 && count == 33) {
        // Transition from الحمد لله to الله اكبر
        phraseCount = 2;
        count = 0;
      } else if (phraseCount == 2 && count == 34) {
        // Reset back to سبحان الله after الله اكبر
        phraseCount = 0;
        count = 0;
      }
      
      rotation += 10;
      _controller.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 280,
                      height: 280,
                      child: Transform.rotate(
                        angle: rotation * pi / 180,
                        child: CustomPaint(
                          size: const Size(280, 280),
                          painter: BeadsPainter(),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'عدد التسبيحات',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: const Color(0xFFC19A6B).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFFC19A6B),
                      width: 2,
                    ),
                  ),
                  child: Text(
                    count.toString(),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC19A6B),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: ElevatedButton(
                    onPressed: _handleTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC19A6B),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      getCurrentPhrase(),
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BeadsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFC19A6B)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;
    const beadCount = 33;

    // Draw beads
    for (int i = 0; i < beadCount; i++) {
      final angle = (2 * pi * i) / beadCount;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      canvas.drawCircle(Offset(x, y), 6, paint);
    }

    // Draw sebha head
    final headPath = Path();
    
    // Base
    headPath.moveTo(center.dx - 10, center.dy - radius - 10);
    headPath.lineTo(center.dx + 10, center.dy - radius - 10);
    headPath.lineTo(center.dx + 8, center.dy - radius - 20);
    headPath.lineTo(center.dx - 8, center.dy - radius - 20);
    headPath.close();
    
    // Middle section
    headPath.moveTo(center.dx - 8, center.dy - radius - 20);
    headPath.lineTo(center.dx + 8, center.dy - radius - 20);
    headPath.lineTo(center.dx + 6, center.dy - radius - 30);
    headPath.lineTo(center.dx - 6, center.dy - radius - 30);
    headPath.close();
    
    // Top section
    headPath.moveTo(center.dx - 6, center.dy - radius - 30);
    headPath.lineTo(center.dx + 6, center.dy - radius - 30);
    headPath.lineTo(center.dx + 4, center.dy - radius - 40);
    headPath.lineTo(center.dx - 4, center.dy - radius - 40);
    headPath.close();
    
    // Top circle
    final topCircleCenter = Offset(center.dx, center.dy - radius - 45);
    
    canvas.drawPath(headPath, paint);
    canvas.drawCircle(topCircleCenter, 5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}