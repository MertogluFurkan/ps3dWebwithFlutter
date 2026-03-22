import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      color: const Color(0xFF080808),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top: 3 columns (or stacked on mobile)
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BrandColumn(onLaunch: _launch),
                    const SizedBox(height: 32),
                    _LinksColumn(onLaunch: _launch),
                    const SizedBox(height: 32),
                    _ContactColumn(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _BrandColumn(onLaunch: _launch)),
                    const SizedBox(width: 40),
                    Expanded(child: _LinksColumn(onLaunch: _launch)),
                    const SizedBox(width: 40),
                    Expanded(child: _ContactColumn()),
                  ],
                ),

          const SizedBox(height: 40),
          const Divider(color: Colors.white12),
          const SizedBox(height: 20),

          // Bottom: copyright
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '© 2025 PS3D — Tüm hakları saklıdır.',
                      style: GoogleFonts.montserrat(
                          color: Colors.white38, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.flutter_dash,
                            color: Color(0xFF54C5F8), size: 16),
                        const SizedBox(width: 6),
                        Text(
                          'Built with Flutter',
                          style: GoogleFonts.montserrat(
                              color: Colors.white24, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '© 2025 PS3D — Tüm hakları saklıdır.',
                      style: GoogleFonts.montserrat(
                          color: Colors.white38, fontSize: 13),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.flutter_dash,
                            color: Color(0xFF54C5F8), size: 16),
                        const SizedBox(width: 6),
                        Text(
                          'Built with Flutter',
                          style: GoogleFonts.montserrat(
                              color: Colors.white24, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

// ─── Brand column ──────────────────────────────────────────────────────────────
class _BrandColumn extends StatelessWidget {
  final Future<void> Function(String) onLaunch;
  const _BrandColumn({required this.onLaunch});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/ps3d2.png', height: 52),
        const SizedBox(height: 16),
        Text(
          'PS3D ile hayal ettiğiniz tasarımlar gerçeğe dönüşür.\n3D modelleme ve baskı hizmetlerimizle her projeye özel çözümler sunuyoruz.',
          style: GoogleFonts.montserrat(
            color: Colors.white38,
            fontSize: 13,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _SocialIcon(
              icon: Icons.camera_alt_outlined,
              onTap: () =>
                  onLaunch('https://www.instagram.com/ps3dstore/'),
            ),
            const SizedBox(width: 12),
            _SocialIcon(
              icon: Icons.store_outlined,
              onTap: () =>
                  onLaunch('https://www.shopier.com/ps3dmodel'),
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Links column ──────────────────────────────────────────────────────────────
class _LinksColumn extends StatelessWidget {
  final Future<void> Function(String) onLaunch;
  const _LinksColumn({required this.onLaunch});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FooterHeading('Hızlı Linkler'),
        const SizedBox(height: 16),
        _FooterLink(
          label: 'Instagram',
          onTap: () => onLaunch('https://www.instagram.com/ps3dstore/'),
        ),
        _FooterLink(
          label: 'Shopier Mağazası',
          onTap: () => onLaunch('https://www.shopier.com/ps3dmodel'),
        ),
      ],
    );
  }
}

// ─── Contact column ────────────────────────────────────────────────────────────
class _ContactColumn extends StatelessWidget {
  const _ContactColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FooterHeading('İletişim'),
        const SizedBox(height: 16),
        _ContactRow(icon: Icons.phone_outlined, text: '+90 545 290 70 50'),
        const SizedBox(height: 10),
        _ContactRow(icon: Icons.email_outlined, text: 'ps3dmodel@gmail.com'),
        const SizedBox(height: 10),
        _ContactRow(
            icon: Icons.camera_alt_outlined,
            text: 'instagram.com/ps3dstore'),
      ],
    );
  }
}

// ─── Shared sub-widgets ────────────────────────────────────────────────────────
class _FooterHeading extends StatelessWidget {
  final String text;
  const _FooterHeading(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _FooterLink({required this.label, required this.onTap});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: GoogleFonts.montserrat(
              color:
                  _hovered ? const Color(0xFFC9A84C) : Colors.white54,
              fontSize: 13,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ContactRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFC9A84C), size: 16),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _SocialIcon({required this.icon, required this.onTap});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
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
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: _hovered
                ? const Color(0xFFC9A84C)
                : Colors.white.withOpacity(0.06),
            shape: BoxShape.circle,
            border: Border.all(
              color: _hovered
                  ? const Color(0xFFC9A84C)
                  : Colors.white12,
            ),
          ),
          child: Icon(
            widget.icon,
            color: _hovered ? Colors.black : Colors.white54,
            size: 18,
          ),
        ),
      ),
    );
  }
}
