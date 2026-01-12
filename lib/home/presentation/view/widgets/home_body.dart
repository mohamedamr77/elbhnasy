import 'package:flutter/material.dart';
import 'engagement_header.dart';
import 'circular_profile_image.dart';
import 'poetry_section.dart';
import 'star_separator.dart';
import 'names_badge.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: const [
            EngagementHeader(),
            SizedBox(height: 30),
            CircularProfileImage(),
            SizedBox(height: 40),
            PoetrySection(),
            SizedBox(height: 30),
            StarSeparator(),
            SizedBox(height: 30),
            NamesBadge(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
