import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../responsive.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Container(
      color: const Color(0xFF1A1A1A),
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 30),
      child: Column(
        children: [
          if (isMobile)
            Column(
              children: [
                _footerBrandMobile(),
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _footerLinksMobile('Explore', [
                        'About Us',
                        'Our Causes',
                        'Events',
                        'News',
                        'Contact',
                      ]),
                    ),
                    Expanded(
                      child: _footerLinksMobile('Support', [
                        'Volunteer',
                        'Partners',
                        'Careers',
                        'Donate',
                      ]),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                _footerNewsletterMobile(),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _footerBrand(),
                _footerLinks('Explore', [
                  'About Us',
                  'Our Causes',
                  'Events',
                  'News',
                  'Contact',
                ]),
                _footerLinks('Support', [
                  'Volunteer',
                  'Our Reach',
                  'Partners',
                  'Careers',
                  'Donate',
                ]),
                _footerNewsletter(),
              ],
            ),
          SizedBox(height: isMobile ? 40 : 80),
          const Divider(color: Colors.white12),
          const SizedBox(height: 30),
          if (isMobile)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialIcon(FontAwesomeIcons.facebook),
                    _socialIcon(FontAwesomeIcons.twitter),
                    _socialIcon(FontAwesomeIcons.instagram),
                    _socialIcon(FontAwesomeIcons.linkedin),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  '© 2025 Shanti Sthapna Mission.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white30, fontSize: 12),
                ),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '© 2025 Shanti Sthapna Mission. All rights reserved.',
                  style: TextStyle(color: Colors.white30, fontSize: 13),
                ),
                Row(
                  children: [
                    _socialIcon(FontAwesomeIcons.facebook),
                    _socialIcon(FontAwesomeIcons.twitter),
                    _socialIcon(FontAwesomeIcons.instagram),
                    _socialIcon(FontAwesomeIcons.linkedin),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _footerBrandMobile() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.handHoldingHeart,
              color: Color(0xFF00D494),
              size: 24,
            ),
            const SizedBox(width: 10),
            Text(
              'HelpUs',
              style: GoogleFonts.fredoka(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Join us in our mission to make the world a better place for everyone.',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.grey[400],
            fontSize: 14,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 25),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00D494),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            'DONATE NOW',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _footerLinksMobile(String title, List<String> links) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 20),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              link,
              style: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _footerNewsletterMobile() {
    return Column(
      children: [
        Text(
          'Subscribe',
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Get latest updates and news',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 14),
        ),
        const SizedBox(height: 20),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Email address',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                height: 42,
                width: 42,
                decoration: const BoxDecoration(
                  color: Color(0xFF00D494),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _footerBrand() {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.handHoldingHeart,
                color: Color(0xFF00D494),
                size: 28,
              ),
              const SizedBox(width: 12),
              Text(
                'HelpUs',
                style: GoogleFonts.fredoka(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'Join us in our mission to make the world\na better place for everyone. Together we\ncan create lasting change.',
            style: GoogleFonts.poppins(
              color: Colors.grey[400],
              fontSize: 15,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 35),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00D494),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'DONATE NOW',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerLinks(String title, List<String> links) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: links
                .map(
                  (link) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      link,
                      style: GoogleFonts.poppins(
                        color: Colors.grey[400],
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _footerNewsletter() {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subscribe',
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Get latest updates and news directly\nin your inbox.',
            style: GoogleFonts.poppins(
              color: Colors.grey[400],
              fontSize: 15,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Email address',
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00D494),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        shape: BoxShape.circle,
      ),
      child: Center(child: FaIcon(icon, size: 16, color: Colors.white)),
    );
  }
}
