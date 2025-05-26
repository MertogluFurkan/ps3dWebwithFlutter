import 'package:flutter/material.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('PS3D Store', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/LOGOGUNCEL.png'),
            ),
            const Text('Mobil Görünüm'),
            SizedBox(
              width: width / 2,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Katalog'),
              ),
            ),
            SizedBox(
              width: width / 2,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Hakkımızda'),
              ),
            ),
            SizedBox(
              width: width / 2,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('İletişim'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
