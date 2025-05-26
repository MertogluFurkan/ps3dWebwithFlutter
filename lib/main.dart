import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(const PS3DStoreApp());
}

class PS3DStoreApp extends StatelessWidget {
  const PS3DStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PS3D Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.deepPurple),
      home: const Home(),
    );
  }
}
