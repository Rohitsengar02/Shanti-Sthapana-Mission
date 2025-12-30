import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../responsive.dart';
import '../widgets/nav_header.dart';
import '../widgets/footer.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            const Header(activePage: 'About Us'),
            const SizedBox(height: 20),
            const _AboutHero(),
            const SizedBox(height: 80),
            const _VisionSection(),
            const SizedBox(height: 80),
            const _FocusAreasGrid(),
            const SizedBox(height: 100),
            const _OurImpactSection(), // New Section 1
            const SizedBox(height: 100),
            const _OurHistorySection(), // New Section 2
            const SizedBox(height: 100),
            const _VolunteerSectionAbout(), // New Section 3
            const SizedBox(height: 100),
            const _PartnersSection(), // New Section 4
            const SizedBox(height: 100),
            const _FinalCTASection(), // New Section 5
            const SizedBox(height: 100),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _AboutHero extends StatelessWidget {
  const _AboutHero();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 15 : padding),
      height: isMobile ? 750 : 500, // Adjusted height for mobile stacking
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF00897B), // Deep Teal Green like design
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: const AssetImage(
            'assets/images/about.png',
          ), // Background texture/image
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            const Color(0xFF00897B).withValues(alpha: 0.85),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: Stack(
        children: [
          // Background Gradient Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(isMobile ? 30 : 60),
            child: isMobile
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildContent(context, true),
                      const SizedBox(height: 40),
                      Expanded(child: _buildImage(context)),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(flex: 5, child: _buildContent(context, false)),
                      const SizedBox(width: 40),
                      Expanded(flex: 6, child: _buildImage(context)),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Shanti Sthapana Mission',
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Empowering Communities,\nTransforming Lives',
          style: GoogleFonts.fredoka(
            // Using Fredoka for that friendly rounded look
            color: Colors.white,
            fontSize: isMobile ? 36 : 48,
            height: 1.1,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Committed to providing a sustainable future and nurturing environment for everyone in need.',
          style: GoogleFonts.poppins(
            color: Colors.white.withValues(alpha: 0.9),
            fontSize: isMobile ? 14 : 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 35),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF00897B),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
          child: Text(
            'Learn More',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/inspiration.png',
          ), // Using existing asset
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}

class _VisionSection extends StatelessWidget {
  const _VisionSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeadline(isMobile),
                const SizedBox(height: 20),
                _buildDescription(isMobile),
                const SizedBox(height: 30),
                _buildButton(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _buildHeadline(isMobile)),
                const SizedBox(width: 80),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDescription(isMobile),
                      const SizedBox(height: 30),
                      _buildButton(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildHeadline(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Path to\na Better World',
          style: GoogleFonts.fredoka(
            fontSize: isMobile ? 42 : 56,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A1A),
            height: 1.1,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Explore our inner world and gain insights',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(bool isMobile) {
    return Text(
      'We believe in the transformative power of humanity. Our compassionate team of volunteers is here to guide communities toward healing, growth, and self-discovery through education, healthcare, and social support.',
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.grey[600],
        height: 1.8,
      ),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1A1A1A),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(
        'Join Our Mission',
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}

class _FocusAreasGrid extends StatelessWidget {
  const _FocusAreasGrid();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    // Data for the 4 cards
    final cards = [
      _CardData(
        category: 'Education',
        tags: ['Primary', 'Skill'],
        title: 'Child Education',
        description:
            'Providing basic education and supplies to underprivileged children.',
        image: 'assets/images/hero2.png',
        bgColor: const Color(0xFFE0F7FA), // Light Cyan
        accentColor: const Color(0xFF006064),
      ),
      _CardData(
        category: 'Health',
        tags: ['Camps', 'Checkups'],
        title: 'Medical Camps',
        description:
            'Organizing free health checkups and medicine distribution in rural areas.',
        image: 'assets/images/about.png', // Reusing for demo
        bgColor: const Color(0xFFFFF3E0), // Light Orange
        accentColor: const Color(0xFFE65100),
      ),
      _CardData(
        category: 'Society',
        tags: ['Women', 'Rights'],
        title: 'Women Empowerment',
        description:
            'Skill development workshops to help women become financially independent.',
        image: 'assets/images/hero1.png',
        bgColor: const Color(0xFFF3E5F5), // Light Purple
        accentColor: const Color(0xFF4A148C),
      ),
      _CardData(
        category: 'Nature',
        tags: ['Tree', 'Clean'],
        title: 'Environment Care',
        description:
            'Tree plantation drives and cleanliness awareness campaigns.',
        image: 'assets/images/inspiration.png',
        bgColor: const Color(0xFFF1F8E9), // Light Green
        accentColor: const Color(0xFF33691E),
      ),
    ];

    if (isMobile) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          children: cards
              .map(
                (data) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _FocusCard(data: data, height: 450),
                ),
              )
              .toList(),
        ),
      );
    }

    // Desktop: Row of 4 cards
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: SizedBox(
        height: 600, // Fixed height for alignment
        child: Row(
          children: cards
              .map(
                (data) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: data == cards.last ? 0 : 20,
                    ),
                    child: _FocusCard(data: data),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _CardData {
  final String category;
  final List<String> tags;
  final String title;
  final String description;
  final String image;
  final Color bgColor;
  final Color accentColor;

  _CardData({
    required this.category,
    required this.tags,
    required this.title,
    required this.description,
    required this.image,
    required this.bgColor,
    required this.accentColor,
  });
}

class _FocusCard extends StatelessWidget {
  final _CardData data;
  final double? height;

  const _FocusCard({required this.data, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: data.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Badges
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                _buildBadge(data.tags[0]),
                const SizedBox(width: 10),
                _buildBadge(data.tags[1]),
                const Spacer(),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: data.accentColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),

          // Text Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: GoogleFonts.fredoka(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A1A1A),
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  data.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Image and Button
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                child: Image.asset(
                  data.image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Read More',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: const Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(Icons.arrow_forward_rounded, size: 14),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text.toUpperCase(),
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1A1A1A),
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// --- NEW SECTIONS ---

class _OurImpactSection extends StatelessWidget {
  const _OurImpactSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Container(
      color: const Color(0xFFF8F9FA),
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: padding),
      child: Column(
        children: [
          Text(
            'Our Impact',
            style: GoogleFonts.fredoka(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Making a tangible difference in lives across the region.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 60),
          DisplayLayout(
            isMobile: isMobile,
            children: [
              _buildImpactCard(
                '50k+',
                'Lives Touched',
                Icons.people_outline,
                Colors.blue,
              ),
              _buildImpactCard(
                '120+',
                'Projects Done',
                Icons.assignment_turned_in_outlined,
                Colors.orange,
              ),
              _buildImpactCard(
                '15k+',
                'Volunteers',
                Icons.volunteer_activism,
                Colors.red,
              ),
              _buildImpactCard(
                '5+',
                'Years Served',
                Icons.history,
                Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImpactCard(
    String count,
    String label,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 20),
          Text(
            count,
            style: GoogleFonts.oswald(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

class _OurHistorySection extends StatelessWidget {
  const _OurHistorySection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: [
          Text(
            'Our Journey',
            style: GoogleFonts.fredoka(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 60),
          _buildYearRow(
            isMobile,
            '2020',
            'Inception',
            'Started with a small team of 5 volunteers distributing food during the pandemic.',
          ),
          const SizedBox(height: 40),
          _buildYearRow(
            isMobile,
            '2022',
            'Growth',
            'Expanded to education and healthcare sectors, setting up 3 dedicated centers.',
            reverse: true,
          ),
          const SizedBox(height: 40),
          _buildYearRow(
            isMobile,
            '2024',
            'Global Reach',
            'Partnered with international organizations to scale our impact to new heights.',
          ),
        ],
      ),
    );
  }

  Widget _buildYearRow(
    bool isMobile,
    String year,
    String title,
    String desc, {
    bool reverse = false,
  }) {
    final children = [
      Expanded(
        child: Column(
          crossAxisAlignment: reverse && !isMobile
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              year,
              style: GoogleFonts.oswald(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF00D494).withOpacity(0.2),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: GoogleFonts.fredoka(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              desc,
              style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600]),
              textAlign: reverse && !isMobile
                  ? TextAlign.right
                  : TextAlign.left,
            ),
          ],
        ),
      ),
      const SizedBox(width: 40),
      Expanded(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage('assets/images/about.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ];

    if (isMobile) {
      return Column(children: children);
    }

    return Row(children: reverse ? children.reversed.toList() : children);
  }
}

class _VolunteerSectionAbout extends StatelessWidget {
  const _VolunteerSectionAbout();

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: padding),
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(30),
      ),
      child: isMobile
          ? Column(children: _buildContent(isMobile))
          : Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildContent(isMobile).sublist(0, 2),
                  ),
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [_buildContent(isMobile)[2]],
                  ),
                ),
              ],
            ),
    );
  }

  List<Widget> _buildContent(bool isMobile) {
    return [
      Text(
        'Become a Volunteer',
        style: GoogleFonts.fredoka(
          fontSize: isMobile ? 32 : 42,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(height: isMobile ? 15 : 20),
      Text(
        'Join our family of dedicated individuals working towards a common goal. Your time and skills can change lives.',
        style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[400]),
      ),
      SizedBox(height: isMobile ? 30 : 0),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00D494),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          'Apply Now',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
    ];
  }
}

class _PartnersSection extends StatelessWidget {
  const _PartnersSection();

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: [
          Text(
            'Our Partners',
            style: GoogleFonts.fredoka(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _buildPartnerLogo('Google'),
              _buildPartnerLogo('Microsoft'),
              _buildPartnerLogo('Unicef'),
              _buildPartnerLogo('WHO'),
              _buildPartnerLogo('Red Cross'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPartnerLogo(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: GoogleFonts.oswald(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}

class _FinalCTASection extends StatelessWidget {
  const _FinalCTASection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFF00D494).withOpacity(0.1),
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: padding),
      child: Column(
        children: [
          Icon(
            FontAwesomeIcons.handHoldingHeart,
            size: 50,
            color: const Color(0xFF00D494),
          ),
          const SizedBox(height: 20),
          Text(
            'Ready to Make a Difference?',
            textAlign: TextAlign.center,
            style: GoogleFonts.fredoka(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Your small contribution can create a big impact.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey[700]),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A1A1A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 22),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 10,
            ),
            child: Text(
              'Donate to Mission',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper for repetitive responsive layouts (row vs column)
class DisplayLayout extends StatelessWidget {
  final bool isMobile;
  final List<Widget> children;
  const DisplayLayout({
    super.key,
    required this.isMobile,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        children: children
            .map(
              (c) =>
                  Padding(padding: const EdgeInsets.only(bottom: 20), child: c),
            )
            .toList(),
      );
    }
    return Row(
      children: children
          .map(
            (c) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: c,
              ),
            ),
          )
          .toList(),
    );
  }
}
