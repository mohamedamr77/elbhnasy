import 'package:flutter/material.dart';

class StarSeparator extends StatelessWidget {
  const StarSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeInOutExpo,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60 * value,
                height: 0.5,
                color: const Color(0xFFCBB07B).withOpacity(0.4),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  Icons.star,
                  color: const Color(0xFFCBB07B),
                  size: 20 * value,
                ),
              ),
              Container(
                width: 60 * value,
                height: 0.5,
                color: const Color(0xFFCBB07B).withOpacity(0.4),
              ),
            ],
          ),
        );
      },
    );
  }
}
