import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../responsive.dart';
import '../widgets/nav_header.dart';
import '../widgets/footer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            const Header(activePage: 'Contact'),
            const _ContactHero(),
            const SizedBox(height: 80),
            const _ContactInfoSection(),
            const SizedBox(height: 80),
            const _ContactFormSection(),
            const SizedBox(height: 80),
            const _MapSection(),
            const SizedBox(height: 100),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _ContactHero extends StatelessWidget {
  const _ContactHero();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFF1A1A1A), // Dark Theme for Contact Hero
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: padding),
      child: Column(
        children: [
          Text(
            'Get In Touch',
            textAlign: TextAlign.center,
            style: GoogleFonts.fredoka(
              fontSize: isMobile ? 42 : 56,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: isMobile ? double.infinity : 700,
            child: Text(
              'Have questions or want to volunteer? We are here to help. Reach out to us anytime.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[400],
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactInfoSection extends StatelessWidget {
  const _ContactInfoSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    final cards = [
      _InfoData(
        Icons.location_on_outlined,
        'Our Location',
        '123 Charity Lane, Peace City,\nNew Delhi, India',
      ),
      _InfoData(
        Icons.phone_outlined,
        'Phone Number',
        '+91 987 654 3210\n+91 123 456 7890',
      ),
      _InfoData(
        Icons.email_outlined,
        'Email Address',
        'info@shantimission.com\nsupport@shantimission.com',
      ),
    ];

    if (isMobile) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          children: cards
              .map(
                (c) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _InfoCard(data: c),
                ),
              )
              .toList(),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: cards
            .map(
              (c) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _InfoCard(data: c),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _InfoData {
  final IconData icon;
  final String title;
  final String content;
  _InfoData(this.icon, this.title, this.content);
}

class _InfoCard extends StatelessWidget {
  final _InfoData data;
  const _InfoCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(data.icon, color: const Color(0xFF00D494), size: 30),
          ),
          const SizedBox(height: 20),
          Text(
            data.title,
            style: GoogleFonts.oswald(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            data.content,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactFormSection extends StatelessWidget {
  const _ContactFormSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: padding),
      padding: EdgeInsets.all(isMobile ? 30 : 60),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Send Us a Message',
            style: GoogleFonts.fredoka(
              fontSize: isMobile ? 32 : 40,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'We will get back to you within 24 hours.',
            style: GoogleFonts.poppins(color: Colors.grey[500]),
          ),
          const SizedBox(height: 50),
          isMobile
              ? Column(
                  children: [
                    _buildInput('Your Name'),
                    const SizedBox(height: 20),
                    _buildInput('Email Address'),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: _buildInput('Your Name')),
                    const SizedBox(width: 30),
                    Expanded(child: _buildInput('Email Address')),
                  ],
                ),
          const SizedBox(height: 30),
          _buildInput('Subject'),
          const SizedBox(height: 30),
          _buildInput('Message', maxLines: 5),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00D494),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 10,
                shadowColor: const Color(0xFF00D494).withValues(alpha: 0.4),
              ),
              child: Text(
                'Send Message',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF00D494), width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
    );
  }
}

class _MapSection extends StatelessWidget {
  const _MapSection();

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);

    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage('assets/images/hero2.png'), // Placeholder for map
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.map, color: Color(0xFF00D494)),
              const SizedBox(width: 10),
              Text(
                'View on Google Maps',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
