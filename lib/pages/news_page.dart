import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../responsive.dart';
import '../widgets/nav_header.dart';
import '../widgets/footer.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            const Header(activePage: 'News'),
            const _NewsHero(),
            const SizedBox(height: 60),
            const _FeaturedArticle(),
            const SizedBox(height: 80),
            const _RecentNewsGrid(),
            const SizedBox(height: 100),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _NewsHero extends StatelessWidget {
  const _NewsHero();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFFFFEBEE), // Light Pink/Red
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: padding),
      child: Column(
        children: [
          Text(
            'Latest Updates',
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
              'Stay informed about our recent activities, success stories, and upcoming initiatives.',
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

class _FeaturedArticle extends StatelessWidget {
  const _FeaturedArticle();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Story',
            style: GoogleFonts.fredoka(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    'assets/images/hero2.png',
                    height: isMobile ? 400 : 500,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: isMobile ? 400 : 500,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(isMobile ? 20 : 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE65100), // Dark Orange
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'EDUCATION',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'How we educated 500+ children in rural districts last year',
                          style: GoogleFonts.fredoka(
                            color: Colors.white,
                            fontSize: isMobile ? 28 : 42,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Dec 28, 2024 • 5 min read',
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentNewsGrid extends StatelessWidget {
  const _RecentNewsGrid();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    // Sample Data
    final news = [
      _NewsData(
        'Healthcare Camp Success',
        'Medical',
        'assets/images/about.png',
      ),
      _NewsData('New Shelter Opened', 'Shelter', 'assets/images/hero1.png'),
      _NewsData(
        'Volunteer Meetup 2024',
        'Community',
        'assets/images/inspiration.png',
      ),
      _NewsData('Donation Drive Results', 'Impact', 'assets/images/hero2.png'),
      _NewsData(
        'Partnering with WHO',
        'Partnership',
        'assets/images/about.png',
      ),
      _NewsData(
        'Green Earth Initiative',
        'Environment',
        'assets/images/hero1.png',
      ),
    ];

    if (isMobile) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          children: news
              .map(
                (n) => Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: _NewsCard(data: n),
                ),
              )
              .toList(),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Wrap(
        spacing: 30,
        runSpacing: 40,
        children: news
            .map(
              (n) => SizedBox(
                width:
                    (MediaQuery.of(context).size.width - (padding * 2) - 60) /
                    3,
                child: _NewsCard(data: n),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _NewsData {
  final String title;
  final String category;
  final String image;
  _NewsData(this.title, this.category, this.image);
}

class _NewsCard extends StatelessWidget {
  final _NewsData data;
  const _NewsCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            data.image,
            height: 220,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          data.category.toUpperCase(),
          style: GoogleFonts.poppins(
            color: Colors.grey[500],
            fontWeight: FontWeight.bold,
            fontSize: 12,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          data.title,
          style: GoogleFonts.fredoka(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Read More →',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF00D494),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
