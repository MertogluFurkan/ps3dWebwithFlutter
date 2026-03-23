# 🖨️ PS3D Store — Flutter Web

> A modern, responsive e-commerce showcase for premium 3D printed products — built entirely with Flutter for Web.

> Premium 3D baskı ürünlerinin sergilendiği, Flutter ile geliştirilmiş modern ve responsive bir e-ticaret vitrini.

[![Flutter](https://img.shields.io/badge/Flutter-3.41+-02569B?style=flat&logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.11+-0175C2?style=flat&logo=dart)](https://dart.dev)
[![Web](https://img.shields.io/badge/Platform-Web-4285F4?style=flat&logo=google-chrome)](https://flutter.dev/web)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## 📸 Preview / Önizleme

| Desktop | Tablet | Mobile |
|--------|--------|--------|
| 3-column product grid | 2-column layout | Single column cards |
| Full navbar | Compact navbar | AppBar |

---

## ✨ Features / Özellikler

- 🎠 **Hero Carousel** — Auto-playing full-screen image slider with arrow buttons and dot indicators
- 🃏 **Product Cards** — Hover animations, zoom-in dialog, and gold accent effects
- 📐 **Fully Responsive** — Separate layout logic for Mobile / Tablet / Desktop
- 🌐 **Flutter Web** — Cross-screen compatible from a single codebase
- 🔗 **External Links** — Direct routing to Shopier and Instagram
- 🦶 **Footer** — 3-column footer with logo, quick links, and contact info
- 🎨 **Dark Theme** — Premium design with `#0A0A0A` background and gold (`#C9A84C`) accents
- ⚡ **Smooth Animations** — Fluid transitions with `AnimatedContainer` and `AnimatedOpacity`

---

## 🏗️ Project Structure / Proje Yapısı

```
lib/
├── core/
│   └── responsive.dart          # Breakpoint management (Mobile/Tablet/Desktop)
├── data/
│   └── products.dart            # Product data model and list
├── screens/
│   └── home_screen.dart         # Main screen (all sections combined here)
├── widgets/
│   ├── carousel.dart            # HeroCarousel + _HeroContent + _ArrowButton
│   ├── product_card.dart        # ProductCard + _ShopButton
│   ├── header.dart              # AppHeader (floating navbar)
│   └── footer.dart              # AppFooter
└── main.dart
```

---

## 📦 Dependencies / Bağımlılıklar

| Package | Version | Usage |
|---------|---------|-------|
| `google_fonts` | ^6.1.0 | Poppins & Montserrat fonts |
| `url_launcher` | ^6.x | Shopier, Instagram, WhatsApp links |

---

## 🚀 Getting Started / Kurulum

### Requirements / Gereksinimler

- Flutter SDK **3.0+**
- Dart **3.0+**
- Chrome or any modern web browser

### Steps / Adımlar

```bash
# Clone the repository / Repoyu klonla
git clone https://github.com/MertogluFurkan/ps3dWebwithFlutter.git
cd ps3dWebwithFlutter

# Install dependencies / Bağımlılıkları yükle
flutter pub get

# Run in development mode / Geliştirme modunda çalıştır
flutter run -d chrome

# Build for production / Production build al
flutter build web --release
```

The build output will be in `build/web/`. You can deploy this folder to any static web host (cPanel, Netlify, Firebase Hosting, etc.).

Build çıktısı `build/web/` klasöründe oluşur. Bu klasörü herhangi bir statik web sunucusuna deploy edebilirsin.

---

## 📱 Responsive Breakpoints

| Screen | Width | Layout |
|--------|-------|--------|
| Mobile | < 600px | Single column, AppBar |
| Tablet | 600–1024px | 2-column grid, compact navbar |
| Desktop | > 1024px | 3-column grid, full navbar |

---

## 🛍️ Sections / Bölümler

- **Products / Ürünlerimiz** — Full product grid (13+ products)
- **Best Sellers / En Çok Satanlar** — Horizontally scrollable featured product cards
- **About / Hakkımızda** — Company introduction and feature cards
- **Contact / İletişim** — WhatsApp, email and Instagram cards

---

## 🔗 Links / Bağlantılar

- 🛒 **Store / Mağaza:** [shopier.com/ps3dmodel](https://www.shopier.com/ps3dmodel)
- 📸 **Instagram:** [@ps3dstore](https://www.instagram.com/ps3dstore/)
- 💬 **WhatsApp:** [+90 545 290 70 50](https://wa.me/905452907050)

---

## 👨‍💻 Developer / Geliştirici

**Furkan Mertoğlu**  
Mobile & Web Developer

---

## 📄 License / Lisans

This project is licensed under the MIT License.  
Bu proje MIT lisansı altında lisanslanmıştır.

---

<p align="center">
  Built with ❤️ and <img src="https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png" height="16"/> Flutter
</p>
