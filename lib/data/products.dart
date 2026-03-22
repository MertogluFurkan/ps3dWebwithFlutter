class Product {
  final String title;
  final String description;
  final String imagePath;

  const Product({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

const List<Product> products = [
  Product(
    title: 'Captain America',
    description: 'Yüksek kaliteli PLA filament ile üretilmiş, detaylı boyutlu süs objesi.',
    imagePath: 'assets/images/cap.jpg',
  ),
  Product(
    title: 'Angel',
    description: 'İnce detaylarıyla işlenmiş, dekoratif melek figürü.',
    imagePath: 'assets/images/angel.jpg',
  ),
  Product(
    title: 'Abstract Vazo',
    description: 'Modern tasarımlı, benzersiz formlu dekoratif vazo.',
    imagePath: 'assets/images/abstract.jpg',
  ),
  Product(
    title: 'Aslan Buhurdanlık',
    description: 'Detaylı aslan figürlü, özel tasarım buhurdanlık.',
    imagePath: 'assets/images/aslan.jpg',
  ),
  Product(
    title: 'Çiçek',
    description: 'Doğadan ilham alınmış, zarif çiçek dekorasyonu.',
    imagePath: 'assets/images/cicek.png',
  ),
  Product(
    title: 'Örümcek',
    description: 'Detaylı örümcek figürü, koleksiyon ve dekorasyon için ideal.',
    imagePath: 'assets/images/orumcek.png',
  ),
  Product(
    title: 'At Heykeli',
    description: 'Güçlü ve estetik at figürü, premium PLA ile üretilmiştir.',
    imagePath: 'assets/images/att.png',
  ),
  Product(
    title: 'Bale Dansçısı',
    description: 'Zarafetin sembolü, ince işçilikle üretilmiş bale figürü.',
    imagePath: 'assets/images/bale.png',
  ),
];
