import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../responsive.dart';
import '../widgets/nav_header.dart';
import '../widgets/footer.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            const Header(activePage: 'Events'),
            const _EventsHero(),
            const SizedBox(height: 60),
            const _UpcomingEventsList(),
            const SizedBox(height: 100),
            const _PastEventsGrid(),
            const SizedBox(height: 100),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _EventsHero extends StatelessWidget {
  const _EventsHero();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.horizontalPadding(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFFE3F2FD), // Light Blue
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: padding),
      child: Column(
        children: [
          Text(
            'Upcoming Events',
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
              'Join us in our activities and be a part of the change. Mark your calendars!',
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

class _UpcomingEventsList extends StatelessWidget {
  const _UpcomingEventsList();

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);

    final events = [
      _EventData(
        day: '15',
        month: 'NOV',
        title: 'Education Awareness Camp',
        time: '10:00 AM - 4:00 PM',
        location: 'City Community Hall',
        image: 'assets/images/hero2.png',
      ),
      _EventData(
        day: '22',
        month: 'NOV',
        title: 'Charity Marathon 2025',
        time: '6:00 AM - 11:00 AM',
        location: 'Central Park',
        image: 'assets/images/hero1.png',
      ),
      _EventData(
        day: '05',
        month: 'DEC',
        title: 'Winter Clothes Distribution',
        time: '9:00 AM - 5:00 PM',
        location: 'North District Shelter',
        image: 'assets/images/about.png',
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: events
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: _EventListItem(data: e),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _EventData {
  final String day;
  final String month;
  final String title;
  final String time;
  final String location;
  final String image;

  _EventData({
    required this.day,
    required this.month,
    required this.title,
    required this.time,
    required this.location,
    required this.image,
  });
}

class _EventListItem extends StatelessWidget {
  final _EventData data;

  const _EventListItem({required this.data});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: isMobile
          ? Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.asset(
                    data.image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: _buildContent(),
                ),
              ],
            )
          : Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(20),
                  ),
                  child: Image.asset(
                    data.image,
                    height: 200,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: _buildContent(),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF00D494).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                data.day,
                style: GoogleFonts.oswald(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF00D494),
                ),
              ),
              Text(
                data.month,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                style: GoogleFonts.fredoka(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.clock,
                    size: 14,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 8),
                  Text(
                    data.time,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(width: 20),
                  FaIcon(
                    FontAwesomeIcons.locationDot,
                    size: 14,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 8),
                  Text(
                    data.location,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A1A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Register Now'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PastEventsGrid extends StatelessWidget {
  const _PastEventsGrid();

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: [
          Text(
            'Past Events',
            style: GoogleFonts.fredoka(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          _buildGrid(isMobile),
        ],
      ),
    );
  }

  Widget _buildGrid(bool isMobile) {
    final events = List.generate(3, (index) => 'Past Event ${index + 1}');

    if (isMobile) {
      return Column(
        children: events
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _PastEventCard(title: e),
              ),
            )
            .toList(),
      );
    }

    return Row(
      children: events
          .map(
            (e) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _PastEventCard(title: e),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _PastEventCard extends StatelessWidget {
  final String title;
  const _PastEventCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              'assets/images/inspiration.png',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              color: Colors.black.withValues(alpha: 0.2),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.fredoka(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Successfully concluded with 500+ attendees.',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.grey[600],
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
