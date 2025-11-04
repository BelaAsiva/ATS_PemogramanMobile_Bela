import 'package:flutter/material.dart';

class Menu3Kalkulator extends StatefulWidget {
  const Menu3Kalkulator({super.key});

  @override
  _Menu3KalkulatorState createState() => _Menu3KalkulatorState();
}

class _Menu3KalkulatorState extends State<Menu3Kalkulator> {
  String _display = ''; // Menyimpan angka yang ditampilkan

  // Fungsi ketika tombol angka ditekan
  void tekanAngka(String angka) {
    setState(() {
      _display = angka;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulator Angka'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tampilan layar kalkulator
            Container(
              height: 100,
              width: 300,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Text(
                _display,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Baris tombol 1–3
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buatTombol('1'),
                const SizedBox(width: 10),
                buatTombol('2'),
                const SizedBox(width: 10),
                buatTombol('3'),
              ],
            ),
            const SizedBox(height: 10),

            // Baris tombol 4–6
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buatTombol('4'),
                const SizedBox(width: 10),
                buatTombol('5'),
                const SizedBox(width: 10),
                buatTombol('6'),
              ],
            ),
            const SizedBox(height: 10),

            // Baris tombol 7–9
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buatTombol('7'),
                const SizedBox(width: 10),
                buatTombol('8'),
                const SizedBox(width: 10),
                buatTombol('9'),
              ],
            ),
            const SizedBox(height: 10),

            // Tombol 0
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buatTombol('0'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi pembuat tombol angka
  Widget buatTombol(String angka) {
    return SizedBox(
      width: 80,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          tekanAngka(angka);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: const BorderSide(color: Colors.black, width: 1),
          ),
        ),
        child: Text(
          angka,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
