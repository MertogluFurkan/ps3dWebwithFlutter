import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/button.dart';
import '../../widgets/carousel.dart';
import '../../widgets/textbutton.dart';
import '../product_list.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    final GlobalKey hakkimizdaKey = GlobalKey();
    final GlobalKey iletisimKey = GlobalKey();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: HexColor("#F2F2F2"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 240),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                height: height / 4,
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 60,
                      child: Image.asset("assets/images/ps3d2.png"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HoverUnderlineButton(
                          text: "Instagram",
                          onPressed: () async {
                            final Uri url = Uri.parse(
                                'https://www.instagram.com/ps3dstore/');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              throw 'URL açılamıyor.';
                            }
                          },
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        HoverUnderlineButton(
                          text: "Shopier",
                          onPressed: () async {
                            final Uri url =
                                Uri.parse('https://www.shopier.com/ps3dmodel');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              throw 'URL açılamıyor.';
                            }
                          },
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        HoverUnderlineButton(
                          text: "Katalog",
                          onPressed: () {
                            // Tıklama işlemi
                          },
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        HoverUnderlineButton(
                          text: "Hakkımızda",
                          onPressed: () {
                            Scrollable.ensureVisible(
                              hakkimizdaKey.currentContext!,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        HoverUnderlineButton(
                          text: "İletişim",
                          onPressed: () {
                            Scrollable.ensureVisible(
                              iletisimKey.currentContext!,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ImageCarousel(),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Ürünlerimiz",
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 42),
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 800,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ProductCard(
                              title: 'Captain America',
                              description:
                                  'Yüksek kaliteli PLA filament ile üretilmiştir.',
                              imagePath: 'assets/images/cap.jpg',
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ProductCard(
                              title: 'Angel',
                              description: 'Detaylı 3D baskı Iron Man maskesi.',
                              imagePath: 'assets/images/angel.jpg',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ProductCard(
                              title: 'Abstract Vase',
                              description:
                                  'Yüksek kaliteli PLA filament ile üretilmiştir.',
                              imagePath: 'assets/images/abstract.jpg',
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ProductCard(
                              title: 'Aslan Buhurdanlık',
                              description: 'Detaylı 3D baskı Iron Man maskesi.',
                              imagePath: 'assets/images/aslan.jpg',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ProductCard(
                              title: 'Captain America',
                              description:
                                  'Yüksek kaliteli PLA filament ile üretilmiştir.',
                              imagePath: 'assets/images/cap.jpg',
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ProductCard(
                              title: 'Angel',
                              description: 'Detaylı 3D baskı Iron Man maskesi.',
                              imagePath: 'assets/images/angel.jpg',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ProductCard(
                              title: 'Abstract Vase',
                              description:
                                  'Yüksek kaliteli PLA filament ile üretilmiştir.',
                              imagePath: 'assets/images/abstract.jpg',
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ProductCard(
                              title: 'Aslan Buhurdanlık',
                              description: 'Detaylı 3D baskı Iron Man maskesi.',
                              imagePath: 'assets/images/aslan.jpg',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ProductCard(
                              title: 'Abstract Vase',
                              description:
                                  'Yüksek kaliteli PLA filament ile üretilmiştir.',
                              imagePath: 'assets/images/abstract.jpg',
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ProductCard(
                              title: 'Aslan Buhurdanlık',
                              description: 'Detaylı 3D baskı Iron Man maskesi.',
                              imagePath: 'assets/images/aslan.jpg',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ProductCard(
                              title: 'Abstract Vase',
                              description:
                                  'Yüksek kaliteli PLA filament ile üretilmiştir.',
                              imagePath: 'assets/images/abstract.jpg',
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ProductCard(
                              title: 'Aslan Buhurdanlık',
                              description: 'Detaylı 3D baskı Iron Man maskesi.',
                              imagePath: 'assets/images/aslan.jpg',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ProductCard(
                              title: 'Abstract Vase',
                              description:
                                  'Yüksek kaliteli PLA filament ile üretilmiştir.',
                              imagePath: 'assets/images/abstract.jpg',
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ProductCard(
                              title: 'Aslan Buhurdanlık',
                              description: 'Detaylı 3D baskı Iron Man maskesi.',
                              imagePath: 'assets/images/aslan.jpg',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ProductCard(
                              title: 'Abstract Vase',
                              description:
                                  'Yüksek kaliteli PLA filament ile üretilmiştir.',
                              imagePath: 'assets/images/abstract.jpg',
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ProductCard(
                              title: 'Aslan Buhurdanlık',
                              description: 'Detaylı 3D baskı Iron Man maskesi.',
                              imagePath: 'assets/images/aslan.jpg',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ProductCard(
                              title: 'Abstract Vase',
                              description:
                                  'Yüksek kaliteli PLA filament ile üretilmiştir.',
                              imagePath: 'assets/images/abstract.jpg',
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ProductCard(
                              title: 'Aslan Buhurdanlık',
                              description: 'Detaylı 3D baskı Iron Man maskesi.',
                              imagePath: 'assets/images/aslan.jpg',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                key: hakkimizdaKey,
                child: Column(
                  children: [
                    Text(
                      "Hakkımızda",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 42),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 300,
                      child: Text(
                        "Yaratıcılığın sınırlarını zorluyor, hayalleri gerçeğe dönüştürüyoruz.\nBiz, 3D modelleme ve 3D baskı alanında uzmanlaşmış bir ekip olarak, hem bireysel hem de kurumsal müşterilere özel çözümler sunuyoruz.\nİster evinizin bir köşesini süsleyecek benzersiz dekoratif bir obje,\nister üretim sürecinize hız ve esneklik kazandıracak endüstriyel parçalar olsun — tüm ihtiyaçlarınıza özgün tasarımlar ve kaliteli üretimle cevap veriyoruz.\nKendi atölyemizde, son teknoloji 3D yazıcılarla yüksek hassasiyetli üretimler gerçekleştiriyoruz.\nKişiye özel projeler, özel günler için hediyelikler, markanıza özel figürler ya da teknik prototipler… İhtiyacınıza göre tasarlıyor, modelliyor ve gerçeğe dönüştürüyoruz.\n Aynı zamanda, dijital koleksiyonunuzu genişletebileceğiniz kaliteli 3D model dosyalarının satışını da yapıyoruz.\nMüşterilerimizle birebir iletişim kurmayı, süreci şeffaf bir şekilde yönetmeyi ve beklentilerin ötesine geçmeyi önemsiyoruz.\nBizimle çalışan herkes, sadece bir hizmet değil; bir fikir, bir sanat ve bir deneyim satın alır. Gelin, birlikte hayal edelim ve üç boyutta hayat verelim.",
                        style: GoogleFonts.montserrat(
                            fontSize: 19, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      key: iletisimKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "İletişim",
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 42),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              IconButton(
                                icon: Image.asset(
                                  'assets/images/whatsapp.png',
                                  width: 32,
                                  height: 32,
                                ),
                                onPressed: () async {
                                  final Uri whatsappUrl =
                                      Uri.parse('https://wa.me/905452907050');
                                  if (await canLaunchUrl(whatsappUrl)) {
                                    await launchUrl(whatsappUrl,
                                        mode: LaunchMode.externalApplication);
                                  } else {
                                    throw 'WhatsApp açılamıyor.';
                                  }
                                },
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '+90 545 290 70 50',
                                style: GoogleFonts.montserrat(fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(Icons.email, color: Colors.black),
                              const SizedBox(width: 10),
                              Text(
                                'ps3dmodel@gmail.com',
                                style: GoogleFonts.montserrat(fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(Icons.camera_alt_outlined,
                                  color: Colors.black),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () async {
                                  final Uri instaUrl = Uri.parse(
                                      'https://www.instagram.com/ps3dstore/');
                                  if (await canLaunchUrl(instaUrl)) {
                                    await launchUrl(instaUrl,
                                        mode: LaunchMode.externalApplication);
                                  }
                                },
                                child: Text(
                                  'instagram.com/ps3dstore',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Footer section starts here
                    const SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      padding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/images/ps3d2.png",
                                      width: 100,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "PS3D ile hayal ettiğiniz tasarımlar gerçeğe dönüşür. 3D modelleme ve baskı hizmetlerimizle her projeye özel çözümler sunuyoruz.",
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hızlı Linkler",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    GestureDetector(
                                        onTap: () async {
                                          final Uri url = Uri.parse(
                                              'https://www.instagram.com/ps3dstore/');
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url);
                                          } else {
                                            throw 'URL açılamıyor.';
                                          }
                                        },
                                        child: Text("Instagram",
                                            style: GoogleFonts.montserrat(
                                                color: Colors.white70))),
                                    GestureDetector(
                                      onTap: () async {
                                        final Uri url = Uri.parse(
                                            'https://www.shopier.com/ps3dmodel');
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url);
                                        } else {
                                          throw 'URL açılamıyor.';
                                        }
                                      },
                                      child: Text("Shopier",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white70)),
                                    ),
                                   
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "İletişim",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.phone,
                                            color: Colors.white70, size: 16),
                                        const SizedBox(width: 8),
                                        Text("+90 545 290 70 50",
                                            style: GoogleFonts.montserrat(
                                                color: Colors.white70)),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.email,
                                            color: Colors.white70, size: 16),
                                        const SizedBox(width: 8),
                                        Text("ps3dmodel@gmail.com",
                                            style: GoogleFonts.montserrat(
                                                color: Colors.white70)),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.camera_alt,
                                            color: Colors.white70, size: 16),
                                        const SizedBox(width: 8),
                                        Text("instagram.com/ps3dstore",
                                            style: GoogleFonts.montserrat(
                                                color: Colors.white70)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Divider(color: Colors.white24),
                          const SizedBox(height: 10),
                           Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Text(
                              "© 2025 PS3D - Tüm hakları saklıdır.",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // If you have the Flutter logo asset, use the following line:
                                // Image.asset(
                                //   'assets/images/flutter_logo.png',
                                //   width: 20,
                                //   height: 20,
                                // ),
                                // Otherwise, use the Flutter Dash icon:
                                Icon(Icons.flutter_dash, color: Colors.white, size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  "Built with Flutter",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white60,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
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
            ],
          ),
        ),
      ),
    );
  }
}
