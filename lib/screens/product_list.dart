import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder:
                              (_) => Dialog(
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    imagePath,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                        );
                      },
                      child: Stack(
                        children: [
                          Image.asset(
                            imagePath,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          const Positioned(
                            top: 8,
                            right: 8,
                            child: Icon(
                              Icons.zoom_in,
                              size: 20,
                              color: Colors.white,
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 2),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(description, style: const TextStyle(fontSize: 14)),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          'Güncel fiyatlar için Shopier mağazamızı ziyaret edin.\nToplu alımlarda %20 indirim uygulanır.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 40),
      ],
    );
  }
}
