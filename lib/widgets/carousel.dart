import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// ─── Ana export edilen widget ───────────────────────────────────────────────
class HeroCarousel extends StatefulWidget {
  const HeroCarousel({super.key});
  @override
  State<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  static const _images = [
    'assets/images/att.png',
    'assets/images/cicek.png',
    'assets/images/orumcek.png',
    'assets/images/bale.png',
  ];

  int _current = 0;
  late Timer _timer;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      final next = (_current + 1) % _images.length;
      _pageController.animateToPage(next,
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.85;
    return SizedBox(
      height: height.clamp(400, 700),
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _current = i),
            itemCount: _images.length,
            itemBuilder: (_, i) => Image.asset(_images[i],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xCC0A0A0A),
                  Color(0x660A0A0A),
                  Color(0x220A0A0A)
                ],
              ),
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: _HeroContent(),
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_images.length, (i) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _current == i ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _current == i
                        ? const Color(0xFFC9A84C)
                        : Colors.white38,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
          if (MediaQuery.of(context).size.width >= 768) ...[
            Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: _ArrowButton(
                  icon: Icons.chevron_left,
                  onTap: () {
                    final prev =
                        (_current - 1 + _images.length) % _images.length;
                    _pageController.animateToPage(prev,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                ),
              ),
            ),
            Positioned(
              right: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: _ArrowButton(
                  icon: Icons.chevron_right,
                  onTap: () {
                    final next = (_current + 1) % _images.length;
                    _pageController.animateToPage(next,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Hero içerik overlay ─────────────────────────────────────────────────────
class _HeroContent extends StatelessWidget {
  const _HeroContent();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PS3D Store',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: isMobile ? 36 : 58,
                  fontWeight: FontWeight.w700,
                  height: 1.1)),
          const SizedBox(height: 12),
          Text('3D Baskı & Modelleme',
              style: GoogleFonts.montserrat(
                  color: const Color(0xFFC9A84C),
                  fontSize: isMobile ? 16 : 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2)),
          const SizedBox(height: 16),
          SizedBox(
            width: isMobile ? double.infinity : 460,
            child: Text(
              'Hayallerinizi üç boyutta gerçeğe dönüştürüyoruz. Premium kalite, özel tasarım.',
              style: GoogleFonts.montserrat(
                  color: Colors.white70,
                  fontSize: isMobile ? 14 : 16,
                  height: 1.6),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              _CTAButton(
                label: 'Mağazayı Ziyaret Et',
                isPrimary: true,
                onTap: () async {
                  final uri = Uri.parse('https://www.shopier.com/ps3dmodel');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
              ),
              const SizedBox(width: 16),
              _CTAButton(
                label: 'Instagram',
                isPrimary: false,
                onTap: () async {
                  final uri = Uri.parse('https://www.instagram.com/ps3dstore/');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── CTA buton ───────────────────────────────────────────────────────────────
class _CTAButton extends StatefulWidget {
  final String label;
  final bool isPrimary;
  final VoidCallback onTap;

  const _CTAButton(
      {required this.label, required this.isPrimary, required this.onTap});

  @override
  State<_CTAButton> createState() => _CTAButtonState();
}

class _CTAButtonState extends State<_CTAButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_hovered ? const Color(0xFFB8942A) : const Color(0xFFC9A84C))
                : (_hovered
                    ? Colors.white.withOpacity(0.1)
                    : Colors.transparent),
            border: widget.isPrimary ? null : Border.all(color: Colors.white54),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(widget.label,
              style: GoogleFonts.poppins(
                  color: widget.isPrimary ? Colors.black : Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}

// ─── Ok butonu ───────────────────────────────────────────────────────────────
class _ArrowButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ArrowButton({required this.icon, required this.onTap});

  @override
  State<_ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<_ArrowButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: _hovered
                ? Colors.white.withOpacity(0.2)
                : Colors.white.withOpacity(0.08),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24),
          ),
          child: Icon(widget.icon, color: Colors.white, size: 26),
        ),
      ),
    );
  }
}
