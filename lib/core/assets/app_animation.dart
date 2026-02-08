
import 'package:flutter/material.dart';

class ThreeDotsLoader extends StatefulWidget {
  const ThreeDotsLoader({super.key});

  @override
  State<ThreeDotsLoader> createState() => _ThreeDotsLoaderState();
}

class _ThreeDotsLoaderState extends State<ThreeDotsLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            return _buildDot(index);
          }),
        );
      },
    );
  }

  Widget _buildDot(int index) {
    double value = _controller.value;
    double phase = index / 3;

    // distance from active phase
    double diff = (value - phase).abs();
    diff = diff > 1 / 3 ? 1 / 3 : diff;

    // convert distance → animation strength
    double t = 1 - (diff * 3);

    double size = 8 + (6 * t); // 8 → 14
    double opacity = 0.3 + (0.7 * t);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Opacity(
        opacity: opacity,
        child: Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 163, 171, 177),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
