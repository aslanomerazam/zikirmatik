
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Zikirmatik(),
    );
  }
}

class Zikirmatik extends StatefulWidget {
  const Zikirmatik({super.key});

  @override
  State<Zikirmatik> createState() => _ZikirmatikState();
}

class _ZikirmatikState extends State<Zikirmatik> {
  int _count = 0;

  void _increment() => setState(() => _count++);
  void _reset() => setState(() => _count = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // PNG GÖRSEL (arka plan)
          Center(
            child: Image.asset(
              'assets/zikirmatik.png',
              width: 300,
              fit: BoxFit.contain,
            ),
          ),

          // SAYI ekranı (PNG'deki display kısmına denk geliyor)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.34,
            left: MediaQuery.of(context).size.width / 2 - 35,
            child: Text(
              '$_count',
              style: const TextStyle(
                fontSize: 50,
                fontFamily: 'Digital',
                color: Colors.cyanAccent,
                shadows: [
                  Shadow(blurRadius: 25, color: Colors.cyanAccent),
                ],
              ),
            ),
          ),

          // SIFIRLA butonu - küçük yuvarlak, mor neon çerçeve
          Positioned(
            top: MediaQuery.of(context).size.height * 0.51,
            left: MediaQuery.of(context).size.width / 2 - 25,
            child: GestureDetector(
              onTap: _reset,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(color: Colors.purpleAccent, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withAlpha((0.8 * 255).toInt()),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'SIFIRLA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 6,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(blurRadius: 5, color: Colors.purpleAccent),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // COUNT butonu - büyük yuvarlak, mor neon çerçeve
          Positioned(
            top: MediaQuery.of(context).size.height * 0.58,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: GestureDetector(
              onTap: _increment,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(color: Colors.purpleAccent, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withAlpha(230),
                      blurRadius: 20,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'COUNT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(blurRadius: 10, color: Colors.purpleAccent),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
