import 'package:flutter/material.dart';
import '../../widgets/button.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'PS3D Store (Desktop)',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Arka plan resmi
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          // İçerik
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 80.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(
                        'assets/images/LOGOGUNCEL.png',
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlurButton(
                          text: 'Katalog',
                          onTap: () {
                            print('Katalog');
                          },
                          width: width * 0.2,
                        ),
                        const SizedBox(height: 10),
                        BlurButton(
                          text: 'Hakkımızda',
                          onTap: () {
                            print('Hakkımızda');
                          },
                          width: width * 0.2,
                        ),
                        const SizedBox(height: 10),
                        BlurButton(
                          text: 'İletişim',
                          onTap: () {
                            print('İletişim');
                          },
                          width: width * 0.2,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                Stack(
                  children: [
                    Positioned(
                      top: -100,
                      right: -100,
                      child: CircleAvatar(
                        radius: 220,
                        backgroundImage: AssetImage('assets/images/bale.png'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hakkımızda',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                height: 1.5,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      'PS3D Store, 3 boyutlu tasarım ve üretim alanında uzmanlaşmış bir markadır. Solid modelleme teknolojisi kullanarak; hayal ettiğiniz her nesneyi, dijital ortamdan fiziksel dünyaya taşıyoruz. Kalite, yaratıcılık ve müşteri memnuniyeti bizim için yalnızca değer değil, aynı zamanda çalışma prensibidir.\n\n',
                                ),
                                TextSpan(
                                  text: '🧱 Yüksek Kalite & Detaylı İşçilik\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      'Kullandığımız malzemeler ve baskı teknolojileri en üst düzeydedir. Her bir ürünümüz, milimetrik hassasiyetle tasarlanır ve üretim sürecinde birçok kalite kontrol aşamasından geçer.\n\n',
                                ),
                                TextSpan(
                                  text: '🧙‍♂️ Cosplay Tutkunlarına Özel\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      'Oyun, anime veya film karakterlerinin ekipmanları, zırhları, silahları ya da aksesuarları… Cosplay için gereken en dikkat çekici objeleri gerçeğe en yakın şekilde üretiriz.\n\n',
                                ),
                                TextSpan(
                                  text: '🎁 Kişiye Özel Hediyelikler\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      'Doğum günü, yıl dönümü veya özel günler için tasarlanmış, tamamen size özel 3D hediyelik ürünler hazırlıyoruz. Her biri, benzersiz ve unutulmaz bir deneyim sunar.\n\n',
                                ),
                                TextSpan(
                                  text: '🏭 Toplu Sipariş Desteği\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      'Kurumsal firmalar veya organizasyonlar için özel tasarımlı, çok adetli üretim projelerini de başarıyla yürütüyoruz. Her ölçekte talebinize uygun çözümler geliştiriyoruz.\n\n',
                                ),
                                TextSpan(
                                  text: '🤝 Müşteri Memnuniyeti Odaklı\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      'İşin başından sonuna kadar iletişimdeyiz. İsteklerinizi dikkatle dinler, sürece sizi de dahil ederiz. Size özel bir ürün ortaya çıkması için titizlikle çalışırız.\n\n',
                                ),
                                TextSpan(
                                  text:
                                      'Kısacası; PS3D Store, sıradanı değil özel olanı üretir.\nHayal etmeniz yeterli, biz onu modelleyip hayat veririz.',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.justify,
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
    );
  }
}
