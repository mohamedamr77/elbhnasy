import 'package:flutter/material.dart';

class CircularProfileImage extends StatelessWidget {
  const CircularProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: Center(
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFCBB07B).withOpacity(0.2),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFCBB07B).withOpacity(0.4),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/persons.png'),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
