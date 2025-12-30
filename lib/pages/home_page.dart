import 'package:flutter/material.dart';
import '../widgets/nav_header.dart';
import '../widgets/footer.dart';
import '../widgets/sections.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const TopBar(),
            const Header(activePage: 'Home', darkTheme: true),
            const HeroCarousel(),
            const AboutSection(),
            const ServiceCards(),
            const InspirationSection(),
            const StatisticsSection(),
            const CausesSection(),
            const VolunteerSection(),
            const EventsSection(),
            const CTABar(),
            const TestimonialsSection(),
            const GallerySection(),
            const TeamSection(),
            const NewsSection(),
            const FAQSection(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
