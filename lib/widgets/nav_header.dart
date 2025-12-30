import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../responsive.dart';
import '../pages/home_page.dart';
import '../pages/about_us_page.dart';
import '../pages/causes_page.dart';
import '../pages/events_page.dart';
import '../pages/news_page.dart';
import '../pages/contact_page.dart';

// --- TOP BAR ---
class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return const SizedBox.shrink();
    }

    final padding = Responsive.horizontalPadding(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _infoItem(Icons.email_outlined, 'info@shantimission.com'),
              const SizedBox(width: 30),
              _infoItem(Icons.phone_outlined, '+91 987 654 3210'),
            ],
          ),
          Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.facebook,
                size: 14,
                color: Color(0xFF1A1A1A),
              ),
              SizedBox(width: 20),
              FaIcon(
                FontAwesomeIcons.twitter,
                size: 14,
                color: Color(0xFF1A1A1A),
              ),
              SizedBox(width: 20),
              FaIcon(
                FontAwesomeIcons.instagram,
                size: 14,
                color: Color(0xFF1A1A1A),
              ),
              SizedBox(width: 20),
              FaIcon(
                FontAwesomeIcons.linkedin,
                size: 14,
                color: Color(0xFF1A1A1A),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF00D494)),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 13, color: Color(0xFF1A1A1A)),
        ),
      ],
    );
  }
}

// --- HEADER ---
class Header extends StatelessWidget {
  final String activePage;
  final bool darkTheme;

  const Header({super.key, this.activePage = 'Home', this.darkTheme = false});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    final backgroundColor = darkTheme ? const Color(0xFF151515) : Colors.white;
    final textColor = darkTheme ? Colors.white : const Color(0xFF1A1A1A);
    final iconColor = darkTheme ? Colors.white70 : const Color(0xFF1A1A1A);
    final borderColor = darkTheme
        ? Colors.white12
        : Colors.grey.withValues(alpha: 0.1);

    return Container(
      height: isMobile ? 70 : 80,
      padding: EdgeInsets.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(bottom: BorderSide(color: borderColor)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          InkWell(
            onTap: () {
              if (activePage != 'Home') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                  (route) => false,
                );
              }
            },
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(isMobile ? 8 : 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00D494).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.handHoldingHeart,
                    color: const Color(0xFF00D494),
                    size: isMobile ? 20 : 28,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Shanti Sthapana Mission',
                  style: GoogleFonts.fredoka(
                    fontSize: isMobile ? 17 : 22,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          // Desktop/Tablet Navigation
          if (!isMobile)
            Row(
              children: [
                _navLink(
                  context,
                  'Home',
                  active: activePage == 'Home',
                  color: textColor,
                ),
                _navLink(
                  context,
                  'About Us',
                  active: activePage == 'About Us',
                  color: textColor,
                ),
                _navLink(
                  context,
                  'Our Causes',
                  active: activePage == 'Our Causes',
                  color: textColor,
                ),
                _navLink(
                  context,
                  'Events',
                  active: activePage == 'Events',
                  color: textColor,
                ),
                _navLink(
                  context,
                  'News',
                  active: activePage == 'News',
                  color: textColor,
                ),
                _navLink(
                  context,
                  'Contact',
                  active: activePage == 'Contact',
                  color: textColor,
                ),
                const SizedBox(width: 30),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: darkTheme ? Colors.white10 : Colors.grey[50],
                  ),
                  child: Icon(Icons.search, size: 18, color: iconColor),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C5CE7),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 8,
                    shadowColor: const Color(0xFF6C5CE7).withValues(alpha: 0.4),
                  ),
                  child: Text(
                    'DONATE',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          // Mobile Menu Button
          if (isMobile)
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[50],
                  ),
                  child: const Icon(
                    Icons.search,
                    size: 18,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => _showMobileMenu(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6C5CE7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 30),
            _mobileMenuItem(
              'Home',
              Icons.home_outlined,
              activePage == 'Home',
              () {
                Navigator.pop(sheetContext);
                _navigateToPage(context, 'Home');
              },
            ),
            _mobileMenuItem(
              'About Us',
              Icons.info_outline,
              activePage == 'About Us',
              () {
                Navigator.pop(sheetContext);
                _navigateToPage(context, 'About Us');
              },
            ),
            _mobileMenuItem(
              'Our Causes',
              Icons.favorite_outline,
              activePage == 'Our Causes',
              () {
                Navigator.pop(sheetContext);
                _navigateToPage(context, 'Our Causes');
              },
            ),
            _mobileMenuItem(
              'Events',
              Icons.event_outlined,
              activePage == 'Events',
              () {
                Navigator.pop(sheetContext);
                _navigateToPage(context, 'Events');
              },
            ),
            _mobileMenuItem(
              'News',
              Icons.newspaper_outlined,
              activePage == 'News',
              () {
                Navigator.pop(sheetContext);
                _navigateToPage(context, 'News');
              },
            ),
            _mobileMenuItem(
              'Contact',
              Icons.contact_mail_outlined,
              activePage == 'Contact',
              () {
                Navigator.pop(sheetContext);
                _navigateToPage(context, 'Contact');
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(25),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(sheetContext),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C5CE7),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'DONATE NOW',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mobileMenuItem(
    String title,
    IconData icon,
    bool isActive,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFF00D494).withValues(alpha: 0.1)
              : Colors.transparent,
          border: Border(bottom: BorderSide(color: Colors.grey[100]!)),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isActive ? const Color(0xFF00D494) : Colors.grey[600],
              size: 24,
            ),
            const SizedBox(width: 18),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                color: isActive
                    ? const Color(0xFF00D494)
                    : const Color(0xFF1A1A1A),
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  Widget _navLink(
    BuildContext context,
    String title, {
    bool active = false,
    Color? color,
  }) {
    final textColor = color ?? const Color(0xFF1A1A1A);

    return InkWell(
      onTap: () {
        if (!active) {
          _navigateToPage(context, title);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: active ? FontWeight.bold : FontWeight.w500,
                color: active ? const Color(0xFF00D494) : textColor,
              ),
            ),
            if (active) ...[
              const SizedBox(height: 4),
              Container(
                height: 2,
                width: 12,
                decoration: BoxDecoration(
                  color: const Color(0xFF00D494),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, String title) {
    if (title == activePage) return;

    Widget page;
    switch (title) {
      case 'Home':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
          (route) => false,
        );
        return;
      case 'About Us':
        page = const AboutUsPage();
        break;
      case 'Our Causes':
        page = const CausesPage();
        break;
      case 'Events':
        page = const EventsPage();
        break;
      case 'News':
        page = const NewsPage();
        break;
      case 'Contact':
        page = const ContactPage();
        break;
      default:
        page = const HomePage();
    }

    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
}
