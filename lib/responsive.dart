import 'package:flutter/material.dart';

/// Responsive breakpoints and utilities for the NGO website
class Responsive {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  /// Get responsive horizontal padding
  static double horizontalPadding(BuildContext context) {
    final width = screenWidth(context);
    if (width < mobileBreakpoint) return 20;
    if (width < tabletBreakpoint) return 40;
    if (width < desktopBreakpoint) return 60;
    return 100;
  }

  /// Get responsive font size
  static double fontSize(
    BuildContext context, {
    required double desktop,
    double? tablet,
    double? mobile,
  }) {
    if (isMobile(context)) return mobile ?? desktop * 0.7;
    if (isTablet(context)) return tablet ?? desktop * 0.85;
    return desktop;
  }

  /// Get responsive value based on screen size
  static T value<T>(
    BuildContext context, {
    required T desktop,
    T? tablet,
    T? mobile,
  }) {
    if (isMobile(context)) return mobile ?? desktop;
    if (isTablet(context)) return tablet ?? desktop;
    return desktop;
  }

  /// Get responsive grid columns
  static int gridColumns(
    BuildContext context, {
    int desktop = 4,
    int tablet = 2,
    int mobile = 1,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet;
    return desktop;
  }
}

/// Responsive wrapper widget that provides different layouts
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, bool isMobile, bool isTablet)
  builder;

  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < Responsive.mobileBreakpoint;
        final isTablet =
            constraints.maxWidth >= Responsive.mobileBreakpoint &&
            constraints.maxWidth < Responsive.tabletBreakpoint;
        return builder(context, isMobile, isTablet);
      },
    );
  }
}
