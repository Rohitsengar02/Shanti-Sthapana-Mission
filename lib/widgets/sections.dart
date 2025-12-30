import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../responsive.dart';

class HeroCarousel extends StatelessWidget {
  const HeroCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final heroHeight = isMobile ? 500.0 : 850.0;

    return CarouselSlider(
      options: CarouselOptions(
        height: heroHeight,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 7),
        scrollPhysics: const BouncingScrollPhysics(),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: [
        _heroItem(
          context,
          'assets/images/hero1.png',
          'Better Life for\nNeedy People',
          'Bringing Hope',
          heroHeight,
        ),
        _heroItem(
          context,
          'assets/images/hero2.png',
          'Education for\nEvery Child',
          'Brighter Future',
          heroHeight,
        ),
      ],
    );
  }

  Widget _heroItem(
    BuildContext context,
    String image,
    String title,
    String subtitle,
    double height,
  ) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);
    final titleSize = Responsive.fontSize(
      context,
      desktop: 96,
      tablet: 72,
      mobile: 42,
    );
    final descSize = Responsive.fontSize(
      context,
      desktop: 20,
      tablet: 18,
      mobile: 14,
    );

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: isMobile ? Alignment.topCenter : Alignment.centerLeft,
              end: isMobile ? Alignment.bottomCenter : Alignment.centerRight,
              colors: [
                Colors.black.withValues(alpha: 0.85),
                Colors.black.withValues(alpha: 0.5),
                Colors.transparent,
              ],
            ),
          ),
        ),
        Positioned(
          left: padding,
          right: isMobile ? padding : null,
          top: 0,
          bottom: 0,
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 1200),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, double value, child) {
              return Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: Opacity(
                  opacity: value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: isMobile
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 18 : 25,
                          vertical: isMobile ? 8 : 12,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00D494),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          subtitle.toUpperCase(),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 11 : 14,
                            letterSpacing: isMobile ? 2 : 3,
                          ),
                        ),
                      ),
                      SizedBox(height: isMobile ? 20 : 35),
                      Text(
                        title,
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                        style: GoogleFonts.oswald(
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.0,
                          letterSpacing: -2,
                        ),
                      ),
                      SizedBox(height: isMobile ? 20 : 40),
                      SizedBox(
                        width: isMobile ? double.infinity : 550,
                        child: Text(
                          isMobile
                              ? 'Join us in creating positive impact on lives.'
                              : 'Join us in our mission to create a sustainable and positive impact\non the lives of those who need it most.',
                          textAlign: isMobile
                              ? TextAlign.center
                              : TextAlign.left,
                          style: GoogleFonts.poppins(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: descSize,
                            height: 1.8,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(height: isMobile ? 30 : 55),
                      if (isMobile)
                        Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF00D494),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'LEARN MORE',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: const BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'VOLUNTEER',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      else
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF00D494),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 28,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 20,
                                shadowColor: const Color(
                                  0xFF00D494,
                                ).withValues(alpha: 0.5),
                              ),
                              child: Text(
                                'LEARN MORE',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 28,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'VOLUNTEER',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// --- ABOUT SECTION ---
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);
    final titleSize = Responsive.fontSize(
      context,
      desktop: 56,
      tablet: 44,
      mobile: 32,
    );

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 1000),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - value)),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: padding,
                vertical: isMobile ? 40 : 30,
              ),
              child: isMobile
                  ? _buildMobileLayout(context, titleSize)
                  : _buildDesktopLayout(context, titleSize),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(BuildContext context, double titleSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildImageSection(context, false)),
        const SizedBox(width: 80),
        Expanded(child: _buildTextContent(context, titleSize, false)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, double titleSize) {
    return Column(
      children: [
        _buildImageSection(context, true),
        const SizedBox(height: 40),
        _buildTextContent(context, titleSize, true),
      ],
    );
  }

  Widget _buildImageSection(BuildContext context, bool isMobile) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1500),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 40,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/about.png',
              fit: BoxFit.cover,
              height: isMobile ? 300 : 550,
              width: double.infinity,
            ),
          ),
        ),
        Positioned(
          bottom: isMobile ? 15 : 30,
          right: isMobile ? 15 : 30,
          child: Container(
            padding: EdgeInsets.all(isMobile ? 25 : 45),
            decoration: BoxDecoration(
              color: const Color(0xFF00D494),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00D494).withValues(alpha: 0.4),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Text(
              '870k\nRaised',
              textAlign: TextAlign.center,
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 16 : 22,
                height: 1.1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextContent(
    BuildContext context,
    double titleSize,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 50,
              child: Divider(color: Color(0xFF00D494), thickness: 3),
            ),
            const SizedBox(width: 15),
            Text(
              'Our Introduction',
              style: GoogleFonts.poppins(
                color: const Color(0xFF00D494),
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Text(
          isMobile
              ? 'We believe we can save more lives'
              : 'We believe we can\nsave more lives',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.oswald(
            fontSize: titleSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A1A),
            height: 1.1,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Shanti Sthapna Mission is an Indian development organization directly benefiting over 15 lakh children and their families every year, through more than 400 live welfare projects.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            color: Colors.grey[700],
            fontSize: isMobile ? 14 : 17,
            height: 1.8,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: isMobile ? 30 : 45),
        if (!isMobile) ...[
          _aboutPoint(
            FontAwesomeIcons.graduationCap,
            'Children Education',
            'Providing quality education to underprivileged children.',
          ),
          const SizedBox(height: 35),
          _aboutPoint(
            FontAwesomeIcons.users,
            'Support Team',
            'Our dedicated team works to ensure every project succeeds.',
          ),
          const SizedBox(height: 50),
        ],
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6C5CE7),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 40 : 50,
                vertical: isMobile ? 18 : 24,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 10,
              shadowColor: const Color(0xFF6C5CE7).withValues(alpha: 0.5),
            ),
            child: Text(
              'LEARN MORE',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _aboutPoint(IconData icon, String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Color(0xFF6C5CE7),
            shape: BoxShape.circle,
          ),
          child: FaIcon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 25),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                desc,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// --- SERVICE CARDS ---
class ServiceCards extends StatelessWidget {
  const ServiceCards({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    final cards = [
      _serviceCard(
        'We Help',
        const Color(0xFF2D3436),
        FontAwesomeIcons.handHoldingHeart,
        isMobile,
      ),
      _serviceCard(
        'We Educate',
        const Color(0xFF00D494),
        FontAwesomeIcons.bookOpen,
        isMobile,
      ),
      _serviceCard(
        'We Build',
        const Color(0xFF2D3436),
        FontAwesomeIcons.buildingColumns,
        isMobile,
      ),
      _serviceCard(
        'We Nourish',
        const Color(0xFF2D3436),
        FontAwesomeIcons.appleWhole,
        isMobile,
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 30),
      child: isMobile
          ? Column(
              children: [
                Row(
                  children: [
                    Expanded(child: cards[0]),
                    Expanded(child: cards[1]),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: cards[2]),
                    Expanded(child: cards[3]),
                  ],
                ),
              ],
            )
          : Row(children: cards.map((c) => Expanded(child: c)).toList()),
    );
  }

  Widget _serviceCard(String title, Color color, IconData icon, bool isMobile) {
    final bool isActive = title == 'We Educate';
    return Container(
      height: isMobile ? 220 : 420,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.white12, width: 0.5),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ]
            : null,
      ),
      child: Stack(
        children: [
          Positioned(
            right: isMobile ? -20 : -30,
            top: isMobile ? -20 : -30,
            child: Opacity(
              opacity: 0.08,
              child: FaIcon(
                icon,
                size: isMobile ? 100 : 200,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 45,
              vertical: isMobile ? 25 : 70,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(isMobile ? 12 : 18),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: FaIcon(
                    icon,
                    color: Colors.white,
                    size: isMobile ? 20 : 32,
                  ),
                ),
                const Spacer(),
                Text(
                  title.toUpperCase(),
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: isMobile ? 18 : 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    height: 1.1,
                  ),
                ),
                SizedBox(height: isMobile ? 10 : 20),
                if (!isMobile)
                  Text(
                    'Empowering communities through dedicated support.',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 15,
                      height: 1.7,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                if (!isMobile) const SizedBox(height: 35),
                Container(
                  height: 2,
                  width: 40,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- INSPIRATION SECTION ---
class InspirationSection extends StatelessWidget {
  const InspirationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);
    final titleSize = Responsive.fontSize(
      context,
      desktop: 48,
      tablet: 38,
      mobile: 28,
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 50 : 30),
      width: double.infinity,
      color: const Color(0xFF2D3436),
      child: isMobile
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 40,
                        child: Divider(color: Color(0xFF00D494), thickness: 2),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Our Inspiration',
                        style: TextStyle(
                          color: Color(0xFF00D494),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 15),
                      SizedBox(
                        width: 40,
                        child: Divider(color: Color(0xFF00D494), thickness: 2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'We inspire and help them live better',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.oswald(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 25),
                  _inspireItem('We help to create better lives'),
                  _inspireItem('Providing sustainable livelihood'),
                  _inspireItem('Empowering communities'),
                ],
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            SizedBox(
                              width: 40,
                              child: Divider(
                                color: Color(0xFF00D494),
                                thickness: 2,
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Our Inspiration',
                              style: TextStyle(
                                color: Color(0xFF00D494),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'We inspire and help\nthem live better',
                          style: GoogleFonts.oswald(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 30),
                        _inspireItem('We help to create better lives'),
                        _inspireItem('Providing sustainable livelihood'),
                        _inspireItem('Empowering communities for change'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 400,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/inspiration.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _inspireItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF00D494), size: 18),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _logoItem(String name) {
  return Opacity(
    opacity: 0.2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.eco, color: Colors.grey, size: 24),
        const SizedBox(width: 10),
        Text(
          name,
          style: GoogleFonts.ubuntu(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

// --- STATISTICS SECTION ---
class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final stats = [
      _statItem('870k', 'Total Donations', isMobile),
      _statItem('480', 'Campaign Closed', isMobile),
      _statItem('977k', 'Happy People', isMobile),
      _statItem('63+', 'Our Volunteers', isMobile),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 20 : 0,
      ),
      color: const Color(0xFFF9F9F9),
      child: isMobile
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [stats[0], stats[1]],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [stats[2], stats[3]],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: stats,
            ),
    );
  }

  Widget _statItem(String value, String label, bool isMobile) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 2),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double val, child) {
        return Transform.scale(
          scale: val,
          child: Column(
            children: [
              Text(
                value,
                style: GoogleFonts.oswald(
                  fontSize: isMobile ? 36 : 64,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF6C5CE7),
                ),
              ),
              Text(
                label.toUpperCase(),
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 10 : 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  letterSpacing: isMobile ? 1 : 2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// --- CAUSES SECTION (Enhanced) ---
class CausesSection extends StatelessWidget {
  const CausesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);
    final titleSize = Responsive.fontSize(
      context,
      desktop: 48,
      tablet: 38,
      mobile: 28,
    );

    final causeCards = [
      _causeCard(
        'Clean water system for rural poor',
        0.85,
        '6,500',
        '12,500',
        'assets/images/hero1.png',
        isMobile,
      ),
      _causeCard(
        'Beautiful vision for students',
        0.65,
        '4,200',
        '10,000',
        'assets/images/hero2.png',
        isMobile,
      ),
      _causeCard(
        'Raise Fund for Healthy Water',
        0.40,
        '2,100',
        '8,000',
        'assets/images/about.png',
        isMobile,
      ),
      _causeCard(
        'Help Children Love Environment',
        0.95,
        '9,200',
        '10,000',
        'assets/images/inspiration.png',
        isMobile,
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 0 : padding,
        vertical: 30,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 40,
                      child: Divider(color: Color(0xFF00D494), thickness: 2),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Latest Causes',
                      style: TextStyle(
                        color: Color(0xFF00D494),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 15),
                    SizedBox(
                      width: 40,
                      child: Divider(color: Color(0xFF00D494), thickness: 2),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  isMobile
                      ? 'Find the popular cause'
                      : 'Find the popular cause\nand donate them',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 30 : 60),
          if (isMobile)
            SizedBox(
              height: 480,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: causeCards.length,
                itemBuilder: (context, index) =>
                    SizedBox(width: 280, child: causeCards[index]),
              ),
            )
          else
            Row(children: causeCards.map((c) => Expanded(child: c)).toList()),
        ],
      ),
    );
  }

  Widget _causeCard(
    String title,
    double progress,
    String raised,
    String goal,
    String img,
    bool isMobile,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              img,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 25),
                Stack(
                  children: [
                    Container(
                      height: 10,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 10,
                      width: progress * 250,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00D494),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'RAISED',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$$raised',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'GOAL',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$$goal',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
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
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'DONATE NOW',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
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

class VolunteerSection extends StatelessWidget {
  const VolunteerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);
    final titleSize = Responsive.fontSize(
      context,
      desktop: 56,
      tablet: 44,
      mobile: 32,
    );

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 1000),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: padding,
              vertical: isMobile ? 50 : 80,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF6C5CE7),
              image: DecorationImage(
                image: const AssetImage('assets/images/inspiration.png'),
                fit: BoxFit.cover,
                opacity: 0.1 * value,
              ),
            ),
            child: isMobile
                ? Column(
                    children: [
                      Text(
                        'BECOME A VOLUNTEER',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Join your hand with us for a better life',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.oswald(
                          fontSize: titleSize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Our volunteers are working to bring smiles and hope to those in need.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 14,
                          height: 1.6,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Transform.scale(
                        scale: value,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF6C5CE7),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 18,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 10,
                          ),
                          child: Text(
                            'JOIN US NOW',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BECOME A VOLUNTEER',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 4,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Text(
                              'Join your hand with us for\na better life and future',
                              style: GoogleFonts.oswald(
                                fontSize: titleSize,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 35),
                            Text(
                              'Our community of volunteers is working tirelessly to bring smiles and hope to those in need. Your time can change lives.',
                              style: GoogleFonts.poppins(
                                color: Colors.white.withValues(alpha: 0.8),
                                fontSize: 18,
                                height: 1.8,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 100),
                      Transform.scale(
                        scale: value,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF6C5CE7),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 28,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 20,
                            shadowColor: Colors.black.withValues(alpha: 0.3),
                          ),
                          child: Text(
                            'JOIN US NOW',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

// --- EVENTS SECTION ---
class EventsSection extends StatelessWidget {
  const EventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);
    final titleSize = Responsive.fontSize(
      context,
      desktop: 52,
      tablet: 40,
      mobile: 28,
    );

    final eventCards = [
      _eventCard(
        'assets/images/hero1.png',
        'Upcoming Active Network Training',
        '31 Nov',
        isMobile,
      ),
      _eventCard(
        'assets/images/hero2.png',
        'Play for the world with us',
        '25 Nov',
        isMobile,
      ),
      _eventCard(
        'assets/images/inspiration.png',
        'Empowering Next Generation',
        '12 Dec',
        isMobile,
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 0 : padding,
        vertical: isMobile ? 50 : 0,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 40,
                      child: Divider(color: Color(0xFF00D494), thickness: 2),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'UPCOMING EVENTS',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF00D494),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: isMobile ? 11 : 14,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const SizedBox(
                      width: 40,
                      child: Divider(color: Color(0xFF00D494), thickness: 2),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  isMobile
                      ? 'Check latest events'
                      : 'Check latest upcoming events',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 40 : 40),
          if (isMobile)
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: eventCards.length,
                itemBuilder: (context, index) =>
                    SizedBox(width: 280, child: eventCards[index]),
              ),
            )
          else
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Row(
                children: eventCards.map((c) => Expanded(child: c)).toList(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _eventCard(String image, String title, String date, bool isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 40,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                child: Image.asset(
                  image,
                  height: isMobile ? 140 : 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 12 : 20,
                    vertical: isMobile ? 8 : 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C5CE7),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6C5CE7).withValues(alpha: 0.4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Text(
                    date,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 12 : 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(isMobile ? 12 : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.oswald(
                    fontSize: isMobile ? 15 : 20,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: isMobile ? 15 : 25),
                Row(
                  children: [
                    Text(
                      'LEARN MORE',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF1A1A1A),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: isMobile ? 11 : 13,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Color(0xFF00D494),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- CTA BAR ---
class CTABar extends StatelessWidget {
  const CTABar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);
    final titleSize = Responsive.fontSize(
      context,
      desktop: 42,
      tablet: 34,
      mobile: 26,
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 40 : 60,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00D494), Color(0xFF6C5CE7)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: isMobile
          ? Column(
              children: [
                Text(
                  'Join your hand with us for a better life',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF1A1A1A),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'DONATE NOW',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Join your hand with us for a\nbetter life and future world',
                    style: GoogleFonts.oswald(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF1A1A1A),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 28,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'DONATE NOW',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

// --- NEW SECTION 2: TESTIMONIALS ---
class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final titleSize = Responsive.fontSize(
      context,
      desktop: 56,
      tablet: 44,
      mobile: 28,
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 50 : 100),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 40,
                      child: Divider(color: Color(0xFF00D494), thickness: 2),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'THEY LOVE US',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF00D494),
                        fontWeight: FontWeight.bold,
                        letterSpacing: isMobile ? 2 : 5,
                        fontSize: isMobile ? 11 : 14,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const SizedBox(
                      width: 40,
                      child: Divider(color: Color(0xFF00D494), thickness: 2),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  isMobile ? 'What donors say' : 'What our donors are saying',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 40 : 80),
          CarouselSlider(
            options: CarouselOptions(
              height: isMobile ? 280 : 360,
              viewportFraction: isMobile ? 0.85 : 0.33,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              enlargeCenterPage: isMobile,
              enableInfiniteScroll: true,
            ),
            items: [
              _testimonialCard(
                'Sarah Johnson',
                'Beneficiary',
                'The mission changed my life by providing education for my kids.',
                'assets/images/about.png',
                isMobile,
              ),
              _testimonialCard(
                'Michael Chen',
                'Volunteer',
                'Being a part of this team has been truly fulfilling.',
                'assets/images/inspiration.png',
                isMobile,
              ),
              _testimonialCard(
                'Anaya Gupta',
                'Supporter',
                'Seeing the impact first-hand is truly inspiring.',
                'assets/images/hero2.png',
                isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _testimonialCard(
    String name,
    String role,
    String text,
    String image,
    bool isMobile,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 5 : 10,
        vertical: isMobile ? 10 : 20,
      ),
      padding: EdgeInsets.all(isMobile ? 25 : 40),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Color(0xFFE0F9E8)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 40,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FaIcon(
            FontAwesomeIcons.quoteLeft,
            color: const Color(0xFF00D494),
            size: isMobile ? 24 : 30,
          ),
          SizedBox(height: isMobile ? 20 : 30),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 17,
              fontStyle: FontStyle.italic,
              height: 1.7,
              color: Colors.grey[700],
            ),
          ),
          const Spacer(),
          Row(
            children: [
              CircleAvatar(
                radius: isMobile ? 20 : 25,
                backgroundImage: AssetImage(image),
              ),
              SizedBox(width: isMobile ? 12 : 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.oswald(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 20 : 26,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                    Text(
                      role,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF00D494),
                        fontSize: isMobile ? 11 : 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: isMobile ? 1.5 : 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// --- NEW SECTION 3: GALLERY ---
class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final titleSize = Responsive.fontSize(
      context,
      desktop: 52,
      tablet: 40,
      mobile: 28,
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 50 : 80),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
            child: Column(
              children: [
                Text(
                  'OUR GALLERY',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF00D494),
                    fontWeight: FontWeight.bold,
                    letterSpacing: isMobile ? 2 : 4,
                    fontSize: isMobile ? 11 : 14,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  isMobile ? 'See our impact' : 'See our impact in photos',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),
          CarouselSlider(
            options: CarouselOptions(
              height: isMobile ? 250 : 400,
              viewportFraction: isMobile ? 0.7 : 0.25,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: isMobile ? 3 : 0),
              autoPlayAnimationDuration: Duration(seconds: isMobile ? 1 : 5),
              autoPlayCurve: isMobile ? Curves.easeInOut : Curves.linear,
              enableInfiniteScroll: true,
              pauseAutoPlayOnTouch: true,
              scrollPhysics: const BouncingScrollPhysics(),
            ),
            items: [
              _galleryItem('assets/images/hero1.png', isMobile),
              _galleryItem('assets/images/about.png', isMobile),
              _galleryItem('assets/images/hero2.png', isMobile),
              _galleryItem('assets/images/inspiration.png', isMobile),
            ],
          ),
        ],
      ),
    );
  }

  Widget _galleryItem(String img, bool isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 5 : 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.4)],
          ),
        ),
        child: Center(
          child: Icon(
            Icons.zoom_in,
            color: Colors.white,
            size: isMobile ? 30 : 40,
          ),
        ),
      ),
    );
  }
}

// --- NEW SECTION 4: TEAM ---
class TeamSection extends StatelessWidget {
  const TeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);
    final titleSize = Responsive.fontSize(
      context,
      desktop: 42,
      tablet: 34,
      mobile: 26,
    );

    final teamMembers = [
      _teamMember(
        'Jessica Brown',
        'Founder',
        'assets/images/about.png',
        isMobile,
      ),
      _teamMember(
        'Kevin Martin',
        'Coordinator',
        'assets/images/inspiration.png',
        isMobile,
      ),
      _teamMember(
        'Christine Eve',
        'Admin',
        'assets/images/hero2.png',
        isMobile,
      ),
      _teamMember(
        'David Smith',
        'Volunteer',
        'assets/images/hero1.png',
        isMobile,
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 0 : padding,
        vertical: 30,
      ),
      color: const Color(0xFFF9F9F9),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
            child: Column(
              children: [
                Text(
                  'OUR TEAM MEMBERS',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF00D494),
                    fontWeight: FontWeight.bold,
                    letterSpacing: isMobile ? 1 : 2,
                    fontSize: isMobile ? 11 : 14,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Meet our expert team',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 30 : 60),
          if (isMobile)
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: teamMembers.length,
                itemBuilder: (context, index) => teamMembers[index],
              ),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: teamMembers,
            ),
        ],
      ),
    );
  }

  Widget _teamMember(String name, String role, String image, bool isMobile) {
    return Container(
      margin: EdgeInsets.only(right: isMobile ? 15 : 0),
      child: Column(
        children: [
          Container(
            width: isMobile ? 150 : 250,
            height: isMobile ? 180 : 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 20,
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 12 : 20),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 14 : 18,
            ),
          ),
          Text(
            role,
            style: TextStyle(
              color: const Color(0xFF00D494),
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 12 : 14,
            ),
          ),
        ],
      ),
    );
  }
}

// --- NEWS SECTION (Enhanced Blog) ---
class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);
    final titleSize = Responsive.fontSize(
      context,
      desktop: 42,
      tablet: 34,
      mobile: 26,
    );

    final newsCards = [
      _newsCard(
        'assets/images/hero2.png',
        'A place where children feel safe',
        '20 Nov, 2025',
        isMobile,
      ),
      _newsCard(
        'assets/images/about.png',
        'Together we help the world better',
        '18 Nov, 2025',
        isMobile,
      ),
      _newsCard(
        'assets/images/hero1.png',
        'A procurements start life with peace',
        '15 Nov, 2025',
        isMobile,
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 0 : padding,
        vertical: 30,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 40,
                      child: Divider(color: Color(0xFF00D494), thickness: 2),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Latest Blog',
                      style: TextStyle(
                        color: Color(0xFF00D494),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 15),
                    SizedBox(
                      width: 40,
                      child: Divider(color: Color(0xFF00D494), thickness: 2),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  isMobile
                      ? 'Latest news & articles'
                      : 'Check latest news & articles\ncoming from the blog',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 30 : 60),
          if (isMobile)
            SizedBox(
              height: 266,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: newsCards.length,
                itemBuilder: (context, index) =>
                    SizedBox(width: 280, child: newsCards[index]),
              ),
            )
          else
            Row(children: newsCards.map((c) => Expanded(child: c)).toList()),
        ],
      ),
    );
  }

  Widget _newsCard(String img, String title, String date, bool isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 30,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              img,
              height: isMobile ? 130 : 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isMobile ? 12 : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: isMobile ? 12 : 14,
                      color: const Color(0xFF00D494),
                    ),
                    SizedBox(width: isMobile ? 8 : 10),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: isMobile ? 11 : 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 12 : 20),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 22,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: isMobile ? 15 : 25),
                if (!isMobile) const Divider(),
                if (!isMobile) const SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: isMobile ? 10 : 12,
                      backgroundColor: const Color(0xFFEEEEEE),
                      child: Icon(
                        Icons.person,
                        size: isMobile ? 10 : 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: isMobile ? 8 : 10),
                    Text(
                      'By Admin',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: isMobile ? 11 : 13,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'READ MORE',
                      style: TextStyle(
                        color: const Color(0xFF6C5CE7),
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 11 : 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- NEW SECTION 5: FAQ ---
class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);
    final titleSize = Responsive.fontSize(
      context,
      desktop: 52,
      tablet: 42,
      mobile: 28,
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 50 : 80,
      ),
      color: const Color(0xFFF9F9F9),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'COMMON QUERIES',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF00D494),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Frequently asked questions',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 30),
                _faqItem(
                  'How can I donate?',
                  'You can donate via our secure online portal using credit card, bank transfer, or UPI.',
                  isMobile,
                ),
                _faqItem(
                  'Where does my money go?',
                  '90% of all donations go directly to our live welfare projects.',
                  isMobile,
                ),
                _faqItem(
                  'Can I volunteer remotely?',
                  'Yes! We have many digital volunteering opportunities available.',
                  isMobile,
                ),
                _faqItem(
                  'Is my donation tax-deductible?',
                  'Yes, all donations are tax-exempt under section 80G.',
                  isMobile,
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COMMON QUERIES',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF00D494),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Most frequently\nasked questions',
                        style: GoogleFonts.oswald(
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1A1A1A),
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Find answers to all your queries about our operations, donations, and impact.',
                        style: GoogleFonts.poppins(
                          color: Colors.grey[700],
                          fontSize: 18,
                          height: 1.8,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 60),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/about.png',
                          height: 350,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 100),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      _faqItem(
                        'How can I donate?',
                        'You can donate via our secure online portal using credit card, bank transfer, or UPI.',
                        isMobile,
                      ),
                      _faqItem(
                        'Where does my money go?',
                        '90% of all donations go directly to our live welfare projects. 10% is used for administration.',
                        isMobile,
                      ),
                      _faqItem(
                        'Can I volunteer remotely?',
                        'Yes! We have many digital volunteering opportunities available for skills like design and writing.',
                        isMobile,
                      ),
                      _faqItem(
                        'Is my donation tax-deductible?',
                        'Yes, all donations to Shanti Sthapna Mission are tax-exempt under section 80G.',
                        isMobile,
                      ),
                      _faqItem(
                        'How do I track my impact?',
                        'We send monthly progress reports and photos from the field directly to your registered email.',
                        isMobile,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _faqItem(String question, String answer, bool isMobile) {
    return Container(
      margin: EdgeInsets.only(bottom: isMobile ? 15 : 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: GoogleFonts.oswald(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 16 : 20,
            color: const Color(0xFF1A1A1A),
            letterSpacing: 0.5,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide.none,
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide.none,
        ),
        iconColor: const Color(0xFF00D494),
        collapsedIconColor: Colors.grey,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              isMobile ? 16 : 25,
              10,
              isMobile ? 16 : 25,
              isMobile ? 20 : 35,
            ),
            child: Text(
              answer,
              style: GoogleFonts.poppins(
                color: const Color(0xFF636E72),
                fontSize: isMobile ? 14 : 17,
                height: 1.7,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- FOOTER ---
