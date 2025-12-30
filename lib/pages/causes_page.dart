import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../responsive.dart';
import '../widgets/nav_header.dart';
import '../widgets/footer.dart';

class CausesPage extends StatelessWidget {
  const CausesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            const Header(activePage: 'Our Causes'),
            const _CausesHero(),
            const SizedBox(height: 60),
            const _CausesGrid(),
            const SizedBox(height: 100),
            const _UrgentNeedSection(),
            const SizedBox(height: 80),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _CausesHero extends StatelessWidget {
  const _CausesHero();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFFF3F2FD), // Light Purple tint
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: padding),
      child: Column(
        children: [
          Text(
            'Our Causes',
            textAlign: TextAlign.center,
            style: GoogleFonts.fredoka(
              fontSize: isMobile ? 42 : 56,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: isMobile ? double.infinity : 700,
            child: Text(
              'We focus on the most critical needs in our community. From education to healthcare, your support changes lives every day.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[600],
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CausesGrid extends StatelessWidget {
  const _CausesGrid();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    // Sample Data
    final causes = [
      _CauseData(
        'Education for All',
        'Help provide books, uniforms, and tuition for underprivileged kids.',
        'assets/images/hero2.png',
        0.75,
        15000,
        20000,
      ),
      _CauseData(
        'Clean Water Project',
        'Installing water filters and sanitary facilities in rural schools.',
        'assets/images/about.png',
        0.45,
        4500,
        10000,
      ),
      _CauseData(
        'Healthy Moms',
        'Nutritional support and medical checkups for expecting mothers.',
        'assets/images/hero1.png',
        0.60,
        6000,
        10000,
      ),
      _CauseData(
        'Winter Relief',
        'Distributing blankets and warm clothes to homeless people.',
        'assets/images/inspiration.png',
        0.90,
        9000,
        10000,
      ),
      _CauseData(
        'Animal Shelter',
        'Feeding and treating stray animals in the city.',
        'assets/images/hero1.png',
        0.30,
        3000,
        10000,
      ),
      _CauseData(
        'Tree Plantation',
        'Aiming to plant 10,000 trees this year for a greener earth.',
        'assets/images/hero2.png',
        0.20,
        2000,
        10000,
      ),
    ];

    if (isMobile) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          children: causes
              .map(
                (c) => Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: _CauseCard(data: c),
                ),
              )
              .toList(),
        ),
      );
    }

    // Desktop Grid
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Wrap(
        spacing: 30,
        runSpacing: 40,
        children: causes
            .map(
              (c) => SizedBox(
                width:
                    (MediaQuery.of(context).size.width - (padding * 2) - 60) /
                    3, // 3 columns
                child: _CauseCard(data: c),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _CauseData {
  final String title;
  final String desc;
  final String image;
  final double progress;
  final int raised;
  final int goal;

  _CauseData(
    this.title,
    this.desc,
    this.image,
    this.progress,
    this.raised,
    this.goal,
  );
}

class _CauseCard extends StatelessWidget {
  final _CauseData data;

  const _CauseCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              data.image,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: GoogleFonts.fredoka(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  data.desc,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 25),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: data.progress,
                    backgroundColor: Colors.grey[200],
                    color: const Color(0xFF00D494),
                    minHeight: 8,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Raised: \$${data.raised}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00D494),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Goal: \$${data.goal}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[500],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A1A1A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Donate Now',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UrgentNeedSection extends StatelessWidget {
  const _UrgentNeedSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: padding),
      padding: EdgeInsets.all(isMobile ? 30 : 60),
      decoration: BoxDecoration(
        color: const Color(0xFFFF6B6B),
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage('assets/images/inspiration.png'),
          fit: BoxFit.cover,
          opacity: 0.1,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'URGENT CAUSE',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFF6B6B),
                fontSize: 12,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'Flood Relief Fund 2025',
            textAlign: TextAlign.center,
            style: GoogleFonts.fredoka(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 600,
            child: Text(
              'Thousands of families displaced due to recent floods in the northern region need immediate food and shelter. Please act now.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white.withValues(alpha: 0.9),
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFFFF6B6B),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              'Donate for Relief',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
