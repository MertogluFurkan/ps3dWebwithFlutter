
// Replaced by lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/carousel.dart';
import '../../widgets/textbutton.dart';
import '../product_list.dart';
import '../product_reels.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final GlobalKey hakkimizdaKey = GlobalKey();
    final GlobalKey iletisimKey = GlobalKey();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: HexColor("#F2F2F2"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 240),
        child: SingleChildScrollView(
          controller: scrollController,
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
                          text: "Hakkımızda",
                          onPressed: () {
                            Scrollable.ensureVisible(
                              hakkimizdaKey.currentContext!,
                              duration: const Duration(seconds: 1),
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
                              duration: const Duration(seconds: 1),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Ürünlerimiz",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 42,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 4,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/36188114",
                          title: 'Kratos Büst',
                          description:
                              'God of War evreninin efsane karakteri Kratos şimdi masanızda hayat buluyor. Detaylı zırh işçiliği, özenle boyanmış yüz hatları ve güçlü duruşuyla bu model, tam bir başyapıt. Oyuncular, koleksiyonerler ve geek kültürünün tutkunları için vazgeçilmez bir dekor parçası. Sınırlı sayıda üretilmiştir. Stoklar tükenmeden hemen sahip olun, efsanevi Kratos sizden emir bekliyor!',
                          imagePath: 'assets/images/kratos.jpg',
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/34885712",
                          title: 'Zarafet Heykeli',
                          description:
                              'Huzurun, estetiğin ve inceliğin vücut bulmuş hali bu özel balerin figürüyle evinize geliyor. PLA filament kullanılarak 3D yazıcıyla özenle üretilen bu zarif tasarım, dansın akışını ve özgürlüğünü yansıtıyor. Evinizin herhangi bir köşesinde sanatsal bir atmosfer oluşturmak istiyorsanız bu figür tam size göre. Minimal ama güçlü duruşu, sade ama etkileyici hatlarıyla hem dekoratif hem de anlam yüklü bir parça. El emeği, göz nuru bir sanat eseriyle yaşam alanınıza ruh katın!',
                          imagePath: 'assets/images/bale.png',
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/35091838",
                          title: 'Handy Vase',
                          description:
                              'Evinize hem zarafet hem de işlevsellik katacak bu eşsiz tasarım, doğadan ilham alan “Handy Home Tray” modeliyle tanışın! 3D baskı teknolojisiyle üretilmiş bu dekoratif obje, yüzük ve takılarınızı düzenlemekle kalmaz; minik bir saksıyla doğayı da yaşam alanınıza taşır. Modern, minimal ve estetik bir dokunuş arıyorsanız bu ürün tam size göre!',
                          imagePath: 'assets/images/handy1.jpg',
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/34734216",
                          title: 'Thanos Büst',
                          description:
                              'Evrenin en güçlü karakteri şimdi senin koleksiyonunda yerini almaya hazır! 3D yazıcı ile detaylı olarak üretilmiş Thanos büstü, Marvel hayranları için tasarlandı. Titizlikle boyanmış, her kıvrımıyla gerçekçiliği yansıtan bu model, evinin, odanın ya da ofisinin havasını tek başına değiştirecek güçte! Mor teni, altın zırhı ve etkileyici duruşuyla tam bir vitrin yıldızı! İster hediye olarak, ister kendi koleksiyonun için tercih et — bu büst, gören herkesin dikkatini çekecek. Üstelik sınırlı sayıda üretildi, yani bu güç herkese nasip olmaz',
                          imagePath: 'assets/images/thanos1.jpg',
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/34789681",
                          title: 'Eclipse Horse',
                          description:
                              'Eclipse Horse, modern dekorasyonun zamansız estetiğini ileri teknoloji ile buluşturuyor. 3D baskı teknolojisiyle üretilen bu şık at figürü, güçlü duruşu ve zarif kıvrımlarıyla bulunduğu her mekânda dikkatleri üzerine çeker. Minimalist çizgileri ve mat siyah yüzeyi sayesinde hem klasik hem de çağdaş dekorasyon stillerine kusursuz bir şekilde uyum sağlar. Işığa verdiği yumuşak gölgelerle günün farklı saatlerinde görsel bir şölene dönüşen Eclipse Horse, ister bir çalışma masasında ilham verici bir obje olarak, ister salonunuzun odak noktası olarak konumlandırılabilir. Koleksiyonerler ve estetik düşkünleri için eşsiz bir hediye alternatifi olan bu heykel, zarif ve anlamlı bir atmosfer yaratmak isteyen herkesin tercihi olacak.',
                          imagePath: 'assets/images/horse1.jpg',
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/34764051",
                          title: 'NoirCorn',
                          description:
                              'Minimalizmin ihtişamla buluştuğu noktadasınız. Noircorn, zarafeti ve gizemi aynı anda taşıyan siyah unicorn figürüdür. Güçlü duruşu ve detaylı kıvrımlarıyla bulunduğu her ortamda dikkat çeker. Modern ev dekorasyonunda mistik bir hava yaratmak isteyenler için ideal. İster ofis masanızda ilham kaynağı olarak konumlandırın, ister yaşam alanınızda tarzınızı konuşturun. Mat siyah kaplaması ve özel dokulu yüzeyiyle farklı olmak isteyenler için üretildi. Her bir bakışta ayrı bir anlam barındıran bu figür, sadece bir obje değil; karakter, stil ve duruşun sembolüdür.',
                          imagePath: 'assets/images/pony1.jpg',
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/34300730",
                          title: 'Leviathan Axe',
                          description:
                              'God of War evreninin en etkileyici silahlarından biri olan Leviathan Baltası, şimdi efsanevi gücüyle koleksiyonunuzun en özel parçası olmaya hazırlanıyor. Kratos’un savaş meydanlarında kullandığı bu muhteşem balta, büyü ile güçlendirilmiş buz efektleri, detaylı işlemeleri ve keskin hatlarıyla gerçek bir sanat eseri. Her kıvrımı titizlikle modellenmiş bu 3D model, yüksek çözünürlüklü dokular ve gerçekçi materyaller ile hayranlık uyandıran bir görünüme sahip. İster koleksiyon amaçlı, ister 3D baskı için, isterse oyun ve animasyon projelerinizde kullanabileceğiniz bu model, oyundaki orijinal tasarıma birebir sadık kalarak hazırlanmıştır. Baltanın üzerindeki runik işlemeler, sivri hatları ve güçlü duruşu, Kratos’un öfkesini ve savaşçı ruhunu tam anlamıyla yansıtıyor. Onu elinize aldığınızda, sadece bir silaha değil, bir efsanenin ruhuna sahip olduğunuzu hissedeceksiniz. Kendi mitolojinizi yaratmak ve projelerinize tanrısal bir güç katmak istiyorsanız, Leviathan Baltası tam size göre! Kaçırmayın ve bu efsanevi silahı koleksiyonunuza ekleyerek God of War’un kudretini hissetmeye başlayın!',
                          imagePath: 'assets/images/levi3.jpeg',
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/34070932",
                          title: 'Captain America Büst',
                          description:
                              'Marvel evreninin en ikonik kahramanlarından biri olan Captain America, şimdi eşsiz bir büst tasarımıyla koleksiyonunuza katılmaya hazır! Bu yüksek kaliteli 3D model, detaylı işçiliği ve kusursuz tasarımıyla, odanıza veya çalışma alanınıza güçlü bir kahraman dokunuşu katacak. Steve Rogers’ın ikonik maskesi, kaslı duruşu ve meşhur kalkanıyla öne çıkan bu büst, koleksiyoncular, Marvel hayranları ve dekorasyon severler için mükemmel bir parça. Film sahnelerinden fırlamış gibi duran bu model, hem kişisel koleksiyonunuza güç katacak hem de harika bir hediye alternatifi olacak!',
                          imagePath: 'assets/images/captain2.jpg',
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/33540126",
                          title: 'MorphVase',
                          description:
                              'Evinizin şıklığını ve modern çizgilerini tamamlayacak, MorphVase 3D baskı vazo ile tanışın! Siyahın asaletiyle işlenmiş benzersiz desenleri, her bakışta farklı bir hikaye anlatırken, canlı çiçeklerle birleştiğinde ortamınıza sofistike bir hava katar. Minimalist, modern ve sanatsal tasarımı sayesinde ister ev dekorasyonunuzda ister ofis masanızda göz alıcı bir detay yaratır. MorphVase, hafif yapısı ve dayanıklı malzemesiyle hem uzun ömürlü hem de kullanışlıdır. 3D baskı teknolojisinin sunduğu ince işçilik ve pürüzsüz yüzeyi sayesinde her detay özenle tasarlanmıştır. Doğayı evinize getirirken tarzınızdan da ödün vermeyin! Evinize modern bir dokunuş, yaşam alanınıza zarif bir hava katın.',
                          imagePath: 'assets/images/morph1.jpg',
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/33445295",
                          title: 'Harmonic Vase',
                          description:
                              'Evinizin şıklığını ve modern çizgilerini tamamlayacak, MorphVase 3D baskı vazo ile tanışın! Siyahın asaletiyle işlenmiş benzersiz desenleri, her bakışta farklı bir hikaye anlatırken, canlı çiçeklerle birleştiğinde ortamınıza sofistike bir hava katar. Minimalist, modern ve sanatsal tasarımı sayesinde ister ev dekorasyonunuzda ister ofis masanızda göz alıcı bir detay yaratır. MorphVase, hafif yapısı ve dayanıklı malzemesiyle hem uzun ömürlü hem de kullanışlıdır. 3D baskı teknolojisinin sunduğu ince işçilik ve pürüzsüz yüzeyi sayesinde her detay özenle tasarlanmıştır. Doğayı evinize getirirken tarzınızdan da ödün vermeyin! Evinize modern bir dokunuş, yaşam alanınıza zarif bir hava katın. ',
                          imagePath: 'assets/images/harmonic.jpg',
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/33409283",
                          title: 'Aurora Vase',
                          description:
                              'Zarafeti ve modern tasarımıyla göz kamaştıran Aurora Vazo, minimalist dokunuşlarla sanatı hayatınıza taşıyor! 3D baskı teknolojisiyle üretilen bu özel vazo, kıvrımlı formu ve şık detaylarıyla mekanınıza sofistike bir hava katıyor. İster taze çiçekleriniz için ister dekoratif bir obje olarak kullanın, Aurora Vazo her ortamda dikkatleri üzerine çekecek. Üstün kaliteli malzemeden üretilen bu tasarım vazo, hem estetik hem de dayanıklılığı bir araya getiriyor. Siz de yaşam alanlarınıza özgünlük katmak için bu eşsiz parçayı keşfedin!',
                          imagePath: 'assets/images/aurora1.jpg',
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/32363640",
                          title: '300 Sparta Kürdanlık',
                          description:
                              'Mitolojik güç ve estetik bir araya geliyor! 300 Spartalı’nın efsanevi kalkanı, şimdi sofralarınızda baş köşede yerini almaya hazır. Bu dikkat çekici kalkan tasarımlı kürdanlık, sıradan bir sofrayı bile destansı bir sahneye dönüştürüyor. El yapımı detaylarıyla, 3D modelleme sanatının bir harikası olarak üretilen bu ürün, yalnızca bir kürdanlık değil, aynı zamanda bir dekorasyon şaheseri.',
                          imagePath: 'assets/images/sparta1.jpg',
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/33163650",
                          title: 'Spider-Man Büst',
                          description:
                              'Spiderman hayranlarının koleksiyonlarına eşsiz bir parça katma zamanı! Bu muhteşem 3D Spiderman Büstü, en ince detaylarıyla tasarlanmış ve hayranlarının favori süper kahramanını gerçek hayata taşımak için özenle modellenmiştir. Yüksek kaliteli malzeme ve kusursuz işçilikle üretilen bu büst, ister ev dekorasyonunuza ister ofis masanıza süper kahraman havası katacak! ',
                          imagePath: 'assets/images/spider2.jpg',
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/32743881",
                          title: 'PenKnight',
                          description:
                              'Masanızın yeni kahramanıyla tanışmaya hazır olun! ⚔️ Şövalye Şeklinde Kalem Tutucu, sadece bir aksesuar değil, aynı zamanda masanızın en asil düzenleyicisi. Bu benzersiz tasarım, kalemlerinizi koruyan bir şövalye gibi işlev görerek hem şık hem de işlevsel bir çözüm sunuyor. İki farklı renk seçeneği ile ofisinizde veya çalışma masanızda dikkat çekecek, sohbet konusu olacak bir detay arıyorsanız, bu ürün tam size göre! Her ayrıntısı ince işçilikle tasarlanmış olan bu kalem tutucu, masanızı daha düzenli ve estetik bir hale getirirken sizi yaratıcı çalışmalarınıza ilham verecek bir atmosferle buluşturacak.',
                          imagePath: 'assets/images/knight5.jpg',
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/32743869",
                          title: 'Valorant Champions Kunai',
                          description:
                              '“Valorant hayranlarına özel: Şimdi en ikonik silah figürü masanızda! 🎮✨ Valorant Champions Bıçak Figürü, sadece bir dekorasyon değil, tutkunuzu yansıtan eşsiz bir koleksiyon parçası. İnce detaylarla tasarlanmış bu figür, oyun dünyasının heyecanını odanıza taşırken, masa üstü düzeninizde stilinizi konuşturacak. Oyuncular, koleksiyonerler ve Valorant severler için mükemmel bir hediye olan bu figür, her bakışta sizi oyunlardaki zafer anlarınıza götürecek. Tarzınıza güç katmak ve favori oyununuzun ruhunu yaşamak için bu benzersiz figürü hemen edinin. Çünkü gerçek oyuncular, tutkularını her yerde yansıtır! 🔥”',
                          imagePath: 'assets/images/kunai3.jpeg',
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ProductCard(
                          link: "https://www.shopier.com/32528930",
                          title: 'Valorant Reaver Karambit',
                          description:
                              'Valorant’ın ikonik Reveal Karambit bıçağı, şimdi koleksiyonunuza eklemek için hazır! Bu detaylı 3D model, oyun tutkunları ve koleksiyon meraklıları için özel olarak tasarlandı. Oyundaki orijinal estetikten ilham alınarak üretilmiş bu bıçak, hem dekoratif bir parça hem de benzersiz bir hediye alternatifi olarak öne çıkıyor. Yüksek kaliteli malzeme ve hassas işçilikle hazırlanan bu model, en küçük detayları bile yansıtarak gerçekçiliğiyle dikkat çekiyor. Masaüstünüzü, oyun odanızı ya da vitrininizi bu çarpıcı parçayla taçlandırabilirsiniz. Hemen sipariş verin ve Valorant tutkunuzu somut bir esere dönüştürün. Stoklarla sınırlıdır, geç kalmayın!',
                          imagePath: 'assets/images/karambit7.jpeg',
                        ),
                      ),
                    ],
                  ),
                  const Row(
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
                  Container(
                    height: height / 12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black12, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final Uri url = Uri.parse(
                                  "https://www.shopier.com/ps3dmodel");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'URL açılamıyor.';
                              }
                            },
                            child: Text(
                              "Bunlar ve Çok Daha Fazlası İçin Katalogumuza Göz Atın",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          IconButton(
                              onPressed: () async {
                                final Uri url = Uri.parse(
                                    "https://www.shopier.com/ps3dmodel");
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'URL açılamıyor.';
                                }
                              },
                              icon: const Icon(Icons.web_stories))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "En Çok Satanlar",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 42,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ]),
              ),
              const SizedBox(height: 8),
              Container(
                height: 4,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(
                height: 40,
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
                    SizedBox(width: 20),
                    ProductReels(
                      title: 'Spider-Man Büst',
                      description:
                          'Marvel hayranları için detaylı olarak üretilmiş bu Spider-Man büstü, koleksiyonların yıldızı olacak.',
                      imagePath: 'assets/images/spider2.jpg',
                      link: 'https://www.shopier.com/33163650',
                    ),
                    SizedBox(width: 20),
                    ProductReels(
                      title: 'Valorant Reaver Karambit',
                      description:
                          'Valorant’ın ikonik Reaver Karambit bıçağı, detaylı işçiliğiyle oyun tutkunlarının beğenisine sunuldu.',
                      imagePath: 'assets/images/karambit7.jpeg',
                      link: 'https://www.shopier.com/32528930',
                    ),
                    SizedBox(width: 20),
                    ProductReels(
                      title: 'Leviathan Axe',
                      description:
                          'Kratos’un efsanevi Leviathan Baltası şimdi 3D baskı detaylarıyla koleksiyonlar için hazır.',
                      imagePath: 'assets/images/levi3.jpeg',
                      link: 'https://www.shopier.com/34300730',
                    ),
                    SizedBox(width: 20),
                    ProductReels(
                      title: 'Handy Vase',
                      description:
                          'Modern ve işlevsel bir dokunuş arayanlara özel tasarım: Handy Vase, doğadan ilhamla üretildi.',
                      imagePath: 'assets/images/handy1.jpg',
                      link: 'https://www.shopier.com/35091838',
                    ),
                    SizedBox(width: 20),
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
                          color: Colors.black,
                          fontSize: 42,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ]),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 4,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(4),
                      ),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "İletişim",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 42,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(0, 2),
                                    blurRadius: 4,
                                  ),
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 4,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      'assets/images/whatsapp.png',
                                      width: 32,
                                      height: 32,
                                    ),
                                    onPressed: () async {
                                      final Uri whatsappUrl = Uri.parse(
                                          'https://wa.me/905452907050');
                                      if (await canLaunchUrl(whatsappUrl)) {
                                        await launchUrl(whatsappUrl,
                                            mode:
                                                LaunchMode.externalApplication);
                                      } else {
                                        throw 'WhatsApp açılamıyor.';
                                      }
                                    },
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      final Uri whatsappUrl = Uri.parse(
                                          'https://wa.me/905452907050');
                                      if (await canLaunchUrl(whatsappUrl)) {
                                        await launchUrl(whatsappUrl,
                                            mode:
                                                LaunchMode.externalApplication);
                                      } else {
                                        throw 'WhatsApp açılamıyor.';
                                      }
                                    },
                                    child: Text(
                                      '+90 545 290 70 50',
                                      style:
                                          GoogleFonts.montserrat(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.email, color: Colors.black),
                                  const SizedBox(width: 10),
                                  Text(
                                    'ps3dmodel@gmail.com',
                                    style: GoogleFonts.montserrat(fontSize: 18),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.camera_alt_outlined,
                                      color: Colors.black),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () async {
                                      final Uri instaUrl = Uri.parse(
                                          'https://www.instagram.com/ps3dstore/');
                                      if (await canLaunchUrl(instaUrl)) {
                                        await launchUrl(instaUrl,
                                            mode:
                                                LaunchMode.externalApplication);
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
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    // FOOTER
                    // FOOTER// FOOTER// FOOTER
                    // FOOTER
                    // FOOTER
                    // FOOTER
                    // FOOTER
                    // FOOTER
                    // FOOTER
                    // FOOTER
                    // FOOTER
                    // FOOTER

                    const SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 60),
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
                                        const Icon(Icons.phone,
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
                                        const Icon(Icons.email,
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
                                        const Icon(Icons.camera_alt,
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
                          const Divider(color: Colors.white24),
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
                                    const Icon(Icons.flutter_dash,
                                        color: Colors.white, size: 20),
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
