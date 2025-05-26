import 'package:flutter/material.dart';
import '../core/responsive.dart';
import 'views/desktop.dart';
import 'views/mobile.dart';
import 'views/tablet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      tablet: HomeTablet(),
      desktop: HomeDesktop(),
    );
  }
}
