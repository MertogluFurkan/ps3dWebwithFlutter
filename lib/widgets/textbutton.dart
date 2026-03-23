import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HoverUnderlineButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const HoverUnderlineButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<HoverUnderlineButton> createState() => _HoverUnderlineButtonState();
}

class _HoverUnderlineButtonState extends State<HoverUnderlineButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 2.5, // Çizgi kalınlığı
              width: _isHovered ? 50 : 0, // Hover olduğunda genişliği aç
              color: Colors.white,
              margin: const EdgeInsets.only(top: 4),
              curve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }
}
