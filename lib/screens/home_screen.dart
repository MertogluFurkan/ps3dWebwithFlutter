import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/responsive.dart';
import '../data/products.dart';
import '../widgets/header.dart';
import '../widgets/carousel.dart';
import '../widgets/product_card.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _catalogKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Hero section (carousel)
                const HeroCarousel(),

                // Products section
                _SectionWrapper(
                  sectionKey: _catalogKey,
                  child: _ProductsSection(),
                ),

                // About section
                _SectionWrapper(
                  sectionKey: _aboutKey,
                  child: _AboutSection(),
                ),

                // Contact section
                _SectionWrapper(
                  sectionKey: _contactKey,
                  child: _ContactSection(),
                ),

                // Footer
                const AppFooter(),
              ],
            ),
          ),

          // Floating header (always on top)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppHeader(
              catalogKey: _catalogKey,
              aboutKey: _aboutKey,
              contactKey: _contactKey,
              scrollController: _scrollController,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Section wrapper ───────────────────────────────────────────────────────────
class _SectionWrapper extends StatelessWidget {
  final GlobalKey sectionKey;
  final Widget child;

  const _SectionWrapper({required this.sectionKey, required this.child});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      key: sectionKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : Responsive.isTablet(context) ? 40 : 80,
        vertical: 72,
      ),
      child: child,
    );
  }
}

// ─── Section heading ───────────────────────────────────────────────────────────
class _SectionHeading extends StatelessWidget {
  final String title;
  final String? subtitle;

  const _SectionHeading({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFFC9A84C),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 14),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              subtitle!,
              style: GoogleFonts.montserrat(
                color: Colors.white38,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// ─── Products section ──────────────────────────────────────────────────────────
class _ProductsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final crossAxisCount = Responsive.isDesktop(context)
        ? 3
        : Responsive.isTablet(context)
            ? 2
            : 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeading(
          title: 'Ürünlerimiz',
          subtitle: 'Premium kalite 3D baskı ürünleri',
        ),
        const SizedBox(height: 40),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: Responsive.isMobile(context) ? 0.78 : 0.72,
          ),
          itemBuilder: (_, i) => ProductCard(product: products[i]),
        ),
        const SizedBox(height: 40),
        Center(
          child: _GoldOutlineButton(
            label: 'Tüm Ürünleri Shopier\'da Gör',
            onTap: () async {
              final uri = Uri.parse('https://www.shopier.com/ps3dmodel');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
          ),
        ),
      ],
    );
  }
}

// ─── About section ─────────────────────────────────────────────────────────────
class _AboutSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeading(title: 'Hakkımızda'),
        const SizedBox(height: 40),
        isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: _AboutText()),
                  const SizedBox(width: 60),
                  Expanded(flex: 2, child: _AboutVisual()),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _AboutText(),
                  const SizedBox(height: 32),
                  _AboutVisual(),
                ],
              ),
        const SizedBox(height: 40),
        _FeatureRow(),
      ],
    );
  }
}

class _AboutText extends StatelessWidget {
  static const _text =
      'Yaratıcılığın sınırlarını zorluyor, hayalleri gerçeğe dönüştürüyoruz.\n\n'
      'Biz, 3D modelleme ve 3D baskı alanında uzmanlaşmış bir ekip olarak, hem bireysel hem de kurumsal müşterilere özel çözümler sunuyoruz. '
      'İster evinizin bir köşesini süsleyecek benzersiz dekoratif bir obje, ister üretim sürecinize hız ve esneklik kazandıracak endüstriyel parçalar olsun — '
      'tüm ihtiyaçlarınıza özgün tasarımlar ve kaliteli üretimle cevap veriyoruz.\n\n'
      'Müşterilerimizle birebir iletişim kurmayı, süreci şeffaf bir şekilde yönetmeyi ve beklentilerin ötesine geçmeyi önemsiyoruz.';

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: GoogleFonts.montserrat(
        color: Colors.white70,
        fontSize: 15,
        height: 1.85,
      ),
    );
  }
}

class _AboutVisual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFC9A84C).withOpacity(0.3)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/images/LOGOGUNCEL.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  static const _features = [
    ('Premium Kalite', 'Yüksek kaliteli PLA ve PETG filamentler', Icons.verified_outlined),
    ('Özel Tasarım', 'Kişiye özel 3D modelleme hizmeti', Icons.design_services_outlined),
    ('Hızlı Teslimat', 'Siparişleriniz özenle paketlenerek gönderilir', Icons.local_shipping_outlined),
    ('Toplu İndirim', 'Toplu alımlarda %20 indirim uygulanır', Icons.discount_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = Responsive.isDesktop(context)
        ? 4
        : Responsive.isTablet(context)
            ? 2
            : 2;

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: Responsive.isMobile(context) ? 1.4 : 1.6,
      children: _features
          .map((f) => _FeatureCard(title: f.$1, desc: f.$2, icon: f.$3))
          .toList(),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final String desc;
  final IconData icon;

  const _FeatureCard(
      {required this.title, required this.desc, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: const Color(0xFFC9A84C).withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFFC9A84C), size: 28),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: GoogleFonts.montserrat(
              color: Colors.white38,
              fontSize: 11,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Contact section ───────────────────────────────────────────────────────────
class _ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeading(
          title: 'İletişim',
          subtitle: 'Bize ulaşın',
        ),
        const SizedBox(height: 40),
        isDesktop
            ? Row(
                children: [
                  Expanded(child: _ContactCard(
                    icon: Icons.phone_outlined,
                    title: 'WhatsApp',
                    value: '+90 545 290 70 50',
                    url: 'https://wa.me/905452907050',
                    iconColor: const Color(0xFF25D366),
                  )),
                  const SizedBox(width: 20),
                  Expanded(child: _ContactCard(
                    icon: Icons.email_outlined,
                    title: 'E-Posta',
                    value: 'ps3dmodel@gmail.com',
                    url: 'mailto:ps3dmodel@gmail.com',
                    iconColor: const Color(0xFFC9A84C),
                  )),
                  const SizedBox(width: 20),
                  Expanded(child: _ContactCard(
                    icon: Icons.camera_alt_outlined,
                    title: 'Instagram',
                    value: '@ps3dstore',
                    url: 'https://www.instagram.com/ps3dstore/',
                    iconColor: const Color(0xFFE1306C),
                  )),
                ],
              )
            : Column(
                children: [
                  _ContactCard(
                    icon: Icons.phone_outlined,
                    title: 'WhatsApp',
                    value: '+90 545 290 70 50',
                    url: 'https://wa.me/905452907050',
                    iconColor: const Color(0xFF25D366),
                  ),
                  const SizedBox(height: 16),
                  _ContactCard(
                    icon: Icons.email_outlined,
                    title: 'E-Posta',
                    value: 'ps3dmodel@gmail.com',
                    url: 'mailto:ps3dmodel@gmail.com',
                    iconColor: const Color(0xFFC9A84C),
                  ),
                  const SizedBox(height: 16),
                  _ContactCard(
                    icon: Icons.camera_alt_outlined,
                    title: 'Instagram',
                    value: '@ps3dstore',
                    url: 'https://www.instagram.com/ps3dstore/',
                    iconColor: const Color(0xFFE1306C),
                  ),
                ],
              ),
      ],
    );
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final String url;
  final Color iconColor;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.url,
    required this.iconColor,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: _hovered
                ? const Color(0xFF1C1C1C)
                : const Color(0xFF141414),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered
                  ? widget.iconColor.withOpacity(0.5)
                  : Colors.white.withOpacity(0.06),
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: widget.iconColor.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: widget.iconColor.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(widget.icon, color: widget.iconColor, size: 22),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.poppins(
                      color: Colors.white60,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.value,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white24,
                size: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Shared button ─────────────────────────────────────────────────────────────
class _GoldOutlineButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _GoldOutlineButton({required this.label, required this.onTap});

  @override
  State<_GoldOutlineButton> createState() => _GoldOutlineButtonState();
}

class _GoldOutlineButtonState extends State<_GoldOutlineButton> {
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
          padding:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered
                ? const Color(0xFFC9A84C)
                : Colors.transparent,
            border: Border.all(color: const Color(0xFFC9A84C)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.poppins(
              color: _hovered ? Colors.black : const Color(0xFFC9A84C),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
