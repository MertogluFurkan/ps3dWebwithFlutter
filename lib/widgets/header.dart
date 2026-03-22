import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/responsive.dart';

class AppHeader extends StatefulWidget {
  final GlobalKey catalogKey;
  final GlobalKey aboutKey;
  final GlobalKey contactKey;
  final ScrollController scrollController;

  const AppHeader({
    super.key,
    required this.catalogKey,
    required this.aboutKey,
    required this.contactKey,
    required this.scrollController,
  });

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = widget.scrollController.offset;
    setState(() {
      _opacity = (offset / 100).clamp(0.0, 0.95);
    });
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _MobileHeader(
        opacity: _opacity,
        onCatalog: () => _scrollTo(widget.catalogKey),
        onAbout: () => _scrollTo(widget.aboutKey),
        onContact: () => _scrollTo(widget.contactKey),
        onInstagram: () => _launch('https://www.instagram.com/ps3dstore/'),
        onShopier: () => _launch('https://www.shopier.com/ps3dmodel'),
      ),
      tablet: _MobileHeader(
        opacity: _opacity,
        onCatalog: () => _scrollTo(widget.catalogKey),
        onAbout: () => _scrollTo(widget.aboutKey),
        onContact: () => _scrollTo(widget.contactKey),
        onInstagram: () => _launch('https://www.instagram.com/ps3dstore/'),
        onShopier: () => _launch('https://www.shopier.com/ps3dmodel'),
      ),
      desktop: _DesktopHeader(
        opacity: _opacity,
        onCatalog: () => _scrollTo(widget.catalogKey),
        onAbout: () => _scrollTo(widget.aboutKey),
        onContact: () => _scrollTo(widget.contactKey),
        onInstagram: () => _launch('https://www.instagram.com/ps3dstore/'),
        onShopier: () => _launch('https://www.shopier.com/ps3dmodel'),
      ),
    );
  }
}

// ─── Desktop Header ────────────────────────────────────────────────────────────

class _DesktopHeader extends StatelessWidget {
  final double opacity;
  final VoidCallback onCatalog;
  final VoidCallback onAbout;
  final VoidCallback onContact;
  final VoidCallback onInstagram;
  final VoidCallback onShopier;

  const _DesktopHeader({
    required this.opacity,
    required this.onCatalog,
    required this.onAbout,
    required this.onContact,
    required this.onInstagram,
    required this.onShopier,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Color.fromRGBO(10, 10, 10, opacity),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(opacity * 0.1),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        children: [
          // Logo
          Image.asset('assets/images/ps3d2.png', height: 48),
          const Spacer(),
          // Nav links
          _NavLink(label: 'Katalog', onTap: onCatalog),
          const SizedBox(width: 32),
          _NavLink(label: 'Hakkımızda', onTap: onAbout),
          const SizedBox(width: 32),
          _NavLink(label: 'İletişim', onTap: onContact),
          const SizedBox(width: 40),
          const _Divider(),
          const SizedBox(width: 40),
          _NavLink(label: 'Instagram', onTap: onInstagram, isExternal: true),
          const SizedBox(width: 32),
          _ShopierButton(onTap: onShopier),
        ],
      ),
    );
  }
}

// ─── Mobile/Tablet Header ──────────────────────────────────────────────────────

class _MobileHeader extends StatelessWidget {
  final double opacity;
  final VoidCallback onCatalog;
  final VoidCallback onAbout;
  final VoidCallback onContact;
  final VoidCallback onInstagram;
  final VoidCallback onShopier;

  const _MobileHeader({
    required this.opacity,
    required this.onCatalog,
    required this.onAbout,
    required this.onContact,
    required this.onInstagram,
    required this.onShopier,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromRGBO(10, 10, 10, opacity.clamp(0.85, 0.95)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Image.asset('assets/images/ps3d2.png', height: 40),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => _openDrawer(context),
          ),
        ],
      ),
    );
  }

  void _openDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF141414),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _MobileMenu(
        onCatalog: () {
          Navigator.pop(context);
          onCatalog();
        },
        onAbout: () {
          Navigator.pop(context);
          onAbout();
        },
        onContact: () {
          Navigator.pop(context);
          onContact();
        },
        onInstagram: () {
          Navigator.pop(context);
          onInstagram();
        },
        onShopier: () {
          Navigator.pop(context);
          onShopier();
        },
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final VoidCallback onCatalog;
  final VoidCallback onAbout;
  final VoidCallback onContact;
  final VoidCallback onInstagram;
  final VoidCallback onShopier;

  const _MobileMenu({
    required this.onCatalog,
    required this.onAbout,
    required this.onContact,
    required this.onInstagram,
    required this.onShopier,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _MenuItem(icon: Icons.grid_view_rounded, label: 'Katalog', onTap: onCatalog),
          _MenuItem(icon: Icons.info_outline, label: 'Hakkımızda', onTap: onAbout),
          _MenuItem(icon: Icons.contact_mail_outlined, label: 'İletişim', onTap: onContact),
          const Divider(color: Colors.white12),
          _MenuItem(icon: Icons.camera_alt_outlined, label: 'Instagram', onTap: onInstagram),
          _MenuItem(icon: Icons.store_outlined, label: 'Shopier Mağazası', onTap: onShopier),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuItem({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: const Color(0xFFC9A84C), size: 22),
      title: Text(
        label,
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}

// ─── Shared sub-widgets ────────────────────────────────────────────────────────

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isExternal;

  const _NavLink({required this.label, required this.onTap, this.isExternal = false});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
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
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _hovered ? const Color(0xFFC9A84C) : Colors.transparent,
                width: 1.5,
              ),
            ),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.poppins(
              color: _hovered ? const Color(0xFFC9A84C) : Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class _ShopierButton extends StatefulWidget {
  final VoidCallback onTap;
  const _ShopierButton({required this.onTap});

  @override
  State<_ShopierButton> createState() => _ShopierButtonState();
}

class _ShopierButtonState extends State<_ShopierButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered ? const Color(0xFFC9A84C) : Colors.transparent,
            border: Border.all(color: const Color(0xFFC9A84C)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            'Shopier',
            style: GoogleFonts.poppins(
              color: _hovered ? Colors.black : const Color(0xFFC9A84C),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 20, color: Colors.white24);
  }
}
