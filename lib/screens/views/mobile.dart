import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../product_list.dart';
import '../product_reels.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: Image.asset("assets/images/ps3d2.png"),
            ),
            const SizedBox(width: 12),
            const Text('PS3D Store', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Text(
              "Ürünlerimiz",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 20),
            // Ürünlerimiz - Tüm ürünler (tam liste)
            const MiniProductReel(
              link: "https://www.shopier.com/36188114",
              title: 'Kratos Büst',
              description:
                  'God of War evreninin efsane karakteri Kratos şimdi masanızda hayat buluyor. Detaylı zırh işçiliği, özenle boyanmış yüz hatları ve güçlü duruşuyla bu model, tam bir başyapıt.',
              imagePath: 'assets/images/kratos.jpg',
            ),
            const SizedBox(height: 20),
            const MiniProductReel(
              link: "https://www.shopier.com/34885712",
              title: 'Zarafet Heykeli',
              description:
                  'Huzurun, estetiğin ve inceliğin vücut bulmuş hali bu özel balerin figürüyle evinize geliyor.',
              imagePath: 'assets/images/bale.png',
            ),
            const SizedBox(height: 20),
            const MiniProductReel(
              link: "https://www.shopier.com/35091838",
              title: 'Handy Vase',
              description:
                  'Evinize hem zarafet hem de işlevsellik katacak bu eşsiz tasarım, doğadan ilham alan “Handy Home Tray” modeliyle tanışın!',
              imagePath: 'assets/images/handy1.jpg',
            ),
            const SizedBox(height: 20),

            const MiniProductReel(
              link: "https://www.shopier.com/34789681",
              title: 'Eclipse Horse',
              description:
                  'Eclipse Horse, modern dekorasyonun zamansız estetiğini ileri teknoloji ile buluşturuyor.',
              imagePath: 'assets/images/horse1.jpg',
            ),
            const SizedBox(height: 20),
            const MiniProductReel(
              link: "https://www.shopier.com/34764051",
              title: 'NoirCorn',
              description:
                  'Minimalizmin ihtişamla buluştuğu noktadasınız. Noircorn, zarafeti ve gizemi aynı anda taşıyan siyah unicorn figürüdür.',
              imagePath: 'assets/images/pony1.jpg',
            ),
            const SizedBox(height: 20),
            const MiniProductReel(
              link: "https://www.shopier.com/34300730",
              title: 'Leviathan Axe',
              description:
                  'God of War evreninin en etkileyici silahlarından biri olan Leviathan Baltası, şimdi efsanevi gücüyle koleksiyonunuzun en özel parçası olmaya hazırlanıyor.',
              imagePath: 'assets/images/levi3.jpeg',
            ),
            const SizedBox(height: 20),
            const MiniProductReel(
              link: "https://www.shopier.com/34070932",
              title: 'Captain America Büst',
              description:
                  'Marvel evreninin en ikonik kahramanlarından biri olan Captain America, şimdi eşsiz bir büst tasarımıyla koleksiyonunuza katılmaya hazır!',
              imagePath: 'assets/images/captain2.jpg',
            ),
            const SizedBox(height: 20),
            const MiniProductReel(
              link: "https://www.shopier.com/33540126",
              title: 'MorphVase',
              description:
                  'Evinizin şıklığını ve modern çizgilerini tamamlayacak, MorphVase 3D baskı vazo ile tanışın!',
              imagePath: 'assets/images/morph1.jpg',
            ),

            const SizedBox(height: 20),
            const MiniProductReel(
              link: "https://www.shopier.com/32363640",
              title: '300 Sparta Kürdanlık',
              description:
                  'Mitolojik güç ve estetik bir araya geliyor! 300 Spartalı’nın efsanevi kalkanı, şimdi sofralarınızda baş köşede.',
              imagePath: 'assets/images/sparta1.jpg',
            ),
            const SizedBox(height: 20),
            const MiniProductReel(
              link: "https://www.shopier.com/33163650",
              title: 'Spider-Man Büst',
              description:
                  'Spiderman hayranlarının koleksiyonlarına eşsiz bir parça katma zamanı! Bu muhteşem 3D Spiderman Büstü.',
              imagePath: 'assets/images/spider2.jpg',
            ),
            const SizedBox(height: 20),
            const MiniProductReel(
              link: "https://www.shopier.com/32743881",
              title: 'PenKnight',
              description:
                  'Masanızın yeni kahramanıyla tanışmaya hazır olun! Şövalye Şeklinde Kalem Tutucu.',
              imagePath: 'assets/images/knight5.jpg',
            ),
            const SizedBox(height: 20),
            const MiniProductReel(
              link: "https://www.shopier.com/32743869",
              title: 'Valorant Champions Kunai',
              description:
                  'Valorant hayranlarına özel: Şimdi en ikonik silah figürü masanızda!',
              imagePath: 'assets/images/kunai3.jpeg',
            ),
            const SizedBox(height: 20),
            const MiniProductReel(
              link: "https://www.shopier.com/32528930",
              title: 'Valorant Reaver Karambit',
              description:
                  'Valorant’ın ikonik Reveal Karambit bıçağı, şimdi koleksiyonunuza eklemek için hazır!',
              imagePath: 'assets/images/karambit7.jpeg',
            ),
            const SizedBox(height: 20),

            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: GestureDetector(
                onTap: () async {
                  final Uri url =
                      Uri.parse("https://www.shopier.com/ps3dmodel");
                  // ignore: deprecated_member_use
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Daha fazla ürün için katalogumuza göz atın",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.web_stories, color: Colors.black),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "En Çok Satanlar",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 20),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductReels(
                    title: 'Kratos Büst',
                    description:
                        'God of War evreninin efsane karakteri Kratos şimdi masanızda hayat buluyor. Detaylı zırh işçiliği ve güçlü duruşuyla koleksiyonunuza güç katın.',
                    imagePath: 'assets/images/kratos.jpg',
                    link: 'https://www.shopier.com/36188114',
                  ),
                  SizedBox(width: 16),
                  ProductReels(
                    title: 'Spider-Man Büst',
                    description:
                        'Marvel hayranları için detaylı olarak üretilmiş bu Spider-Man büstü, koleksiyonların yıldızı olacak.',
                    imagePath: 'assets/images/spider2.jpg',
                    link: 'https://www.shopier.com/33163650',
                  ),
                  SizedBox(width: 16),
                  ProductReels(
                    title: 'Valorant Reaver Karambit',
                    description:
                        'Valorant’ın ikonik Reaver Karambit bıçağı, detaylı işçiliğiyle oyun tutkunlarının beğenisine sunuldu.',
                    imagePath: 'assets/images/karambit7.jpeg',
                    link: 'https://www.shopier.com/32528930',
                  ),
                  SizedBox(width: 16),
                  ProductReels(
                    title: 'Leviathan Axe',
                    description:
                        'Kratos’un efsanevi Leviathan Baltası şimdi 3D baskı detaylarıyla koleksiyonlar için hazır.',
                    imagePath: 'assets/images/levi3.jpeg',
                    link: 'https://www.shopier.com/34300730',
                  ),
                  SizedBox(width: 16),
                  ProductReels(
                    title: 'Handy Vase',
                    description:
                        'Modern ve işlevsel bir dokunuş arayanlara özel tasarım: Handy Vase, doğadan ilhamla üretildi.',
                    imagePath: 'assets/images/handy1.jpg',
                    link: 'https://www.shopier.com/35091838',
                  ),
                  SizedBox(width: 16),
                  ProductReels(
                    title: 'Zarafet Heykeli',
                    description:
                        'Dansın zarafetini simgeleyen bu balerin figürüyle yaşam alanınıza estetik bir dokunuş katın.',
                    imagePath: 'assets/images/bale.png',
                    link: 'https://www.shopier.com/34885712',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Hakkımızda Bölümü
            Text(
              "Hakkımızda",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Yaratıcılığın sınırlarını zorluyor, hayalleri gerçeğe dönüştürüyoruz.\n"
                "Biz, 3D modelleme ve 3D baskı alanında uzmanlaşmış bir ekip olarak, hem bireysel hem de kurumsal müşterilere özel çözümler sunuyoruz.\n"
                "İster evinizin bir köşesini süsleyecek benzersiz dekoratif bir obje, ister üretim sürecinize hız ve esneklik kazandıracak endüstriyel parçalar olsun — "
                "tüm ihtiyaçlarınıza özgün tasarımlar ve kaliteli üretimle cevap veriyoruz.\n"
                "Kendi atölyemizde, son teknoloji 3D yazıcılarla yüksek hassasiyetli üretimler gerçekleştiriyoruz.\n"
                "Kişiye özel projeler, özel günler için hediyelikler, markanıza özel figürler ya da teknik prototipler… İhtiyacınıza göre tasarlıyor, modelliyor ve gerçeğe dönüştürüyoruz.\n"
                "Aynı zamanda, dijital koleksiyonunuzu genişletebileceğiniz kaliteli 3D model dosyalarının satışını da yapıyoruz.\n"
                "Müşterilerimizle birebir iletişim kurmayı, süreci şeffaf bir şekilde yönetmeyi ve beklentilerin ötesine geçmeyi önemsiyoruz.\n"
                "Bizimle çalışan herkes, sadece bir hizmet değil; bir fikir, bir sanat ve bir deneyim satın alır. Gelin, birlikte hayal edelim ve üç boyutta hayat verelim.",
                style: GoogleFonts.montserrat(
                    fontSize: 15, fontWeight: FontWeight.w500, height: 1.35),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 32),
            // İletişim Bölümü
            Text(
              "İletişim",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/whatsapp.png',
                            width: 28, height: 28),
                        onPressed: () async {
                          final Uri whatsappUrl =
                              Uri.parse('https://wa.me/905452907050');
                          if (await canLaunchUrl(whatsappUrl)) {
                            await launchUrl(whatsappUrl);
                          }
                        },
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () async {
                          final Uri whatsappUrl =
                              Uri.parse('https://wa.me/905452907050');
                          if (await canLaunchUrl(whatsappUrl)) {
                            await launchUrl(whatsappUrl);
                          }
                        },
                        child: Text(
                          '+90 545 290 70 50',
                          style: GoogleFonts.montserrat(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.email, color: Colors.black, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        'ps3dmodel@gmail.com',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt_outlined,
                          color: Colors.black, size: 24),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () async {
                          final Uri instaUrl =
                              Uri.parse('https://www.instagram.com/ps3dstore/');
                          if (await canLaunchUrl(instaUrl)) {
                            await launchUrl(instaUrl);
                          }
                        },
                        child: Text(
                          'instagram.com/ps3dstore',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            // FOOTER
            Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/ps3d2.png",
                    width: 70,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "PS3D ile hayal ettiğiniz tasarımlar gerçeğe dönüşür. 3D modelleme ve baskı hizmetlerimizle her projeye özel çözümler sunuyoruz.",
                    style: GoogleFonts.montserrat(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone, color: Colors.white70, size: 16),
                      const SizedBox(width: 6),
                      Text("+90 545 290 70 50",
                          style: GoogleFonts.montserrat(
                              color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.email, color: Colors.white70, size: 16),
                      const SizedBox(width: 6),
                      Text("ps3dmodel@gmail.com",
                          style: GoogleFonts.montserrat(
                              color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt,
                          color: Colors.white70, size: 16),
                      const SizedBox(width: 6),
                      Text("instagram.com/ps3dstore",
                          style: GoogleFonts.montserrat(
                              color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: Colors.white24),
                  const SizedBox(height: 8),
                  Text(
                    "© 2025 PS3D - Tüm hakları saklıdır.",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.flutter_dash,
                          color: Colors.white, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        "Built with Flutter",
                        style: GoogleFonts.montserrat(
                          color: Colors.white60,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MiniProductReel extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String? link;

  const MiniProductReel({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.link,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (link != null) {
          final Uri uri = Uri.parse(link!);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Sol: Görsel
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),

            // Sağ: Başlık + Açıklama + Buton
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        color: Colors.black87,
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    if (link != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Detaylar >",
                          style: GoogleFonts.montserrat(
                            color: Colors.deepOrange,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
