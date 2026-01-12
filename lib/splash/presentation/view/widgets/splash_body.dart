import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../home/presentation/view/home_view.dart';
import 'splash_background.dart';
import 'animated_flower_icon.dart';
import 'animated_arabic_name.dart';
import 'animated_heart_separator.dart';
import 'animated_progress_bar.dart';
import 'splash_footer.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SplashBackground(),
        SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                const AnimatedFlowerIcon(),
                const SizedBox(height: 40),
                const AnimatedArabicName(name: 'محمد'),
                const SizedBox(height: 10),
                const AnimatedHeartSeparator(),
                const SizedBox(height: 10),
                const AnimatedArabicName(name: 'هدى'),
                const SizedBox(height: 60),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1000),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Text(
                        'WELCOME TO OUR STORY',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                          letterSpacing: 4,
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(flex: 4),
                const AnimatedProgressBar(),
                const SizedBox(height: 60),
                const SplashFooter(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
