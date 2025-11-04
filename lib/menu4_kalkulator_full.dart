import 'package:flutter/material.dart';

class Menu4KalkulatorFull extends StatefulWidget {
  const Menu4KalkulatorFull({super.key});

  @override
  State<Menu4KalkulatorFull> createState() => _Menu4KalkulatorFullState();
}

class _Menu4KalkulatorFullState extends State<Menu4KalkulatorFull> {
  String input = ''; // Menyimpan input ekspresi, misalnya: "10-2×3"
  String hasil = ''; // Menyimpan hasil akhir

  // Fungsi ketika tombol angka ditekan
  void tekanAngka(String angka) {
    setState(() {
      input += angka;
    });
  }

  // Fungsi ketika tombol operator ditekan
  void tekanOperator(String op) {
    setState(() {
      if (input.isNotEmpty && !"+-×÷".contains(input[input.length - 1])) {
        input += op;
      }
    });
  }

  // Fungsi untuk tombol "="
  void tekanSamaDengan() {
    try {
      String ekspresi = input.replaceAll('×', '*').replaceAll('÷', '/');
      double nilai = hitungEkspresi(ekspresi);
      setState(() {
        hasil = '= ${hapusNol(nilai)}';
      });
    } catch (e) {
      setState(() {
        hasil = 'Error';
      });
    }
  }

  // Fungsi tombol "C" untuk reset
  void tekanClear() {
    setState(() {
      input = '';
      hasil = '';
    });
  }

  // Fungsi menghapus .0 di hasil bilangan bulat
  String hapusNol(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toString();
  }

  // Fungsi utama untuk menghitung ekspresi matematika
  double hitungEkspresi(String ekspresi) {
    // Pisahkan angka dan operator
    List<String> tokens = [];
    String angka = '';

    for (int i = 0; i < ekspresi.length; i++) {
      String char = ekspresi[i];
      if ('0123456789.'.contains(char)) {
        angka += char;
      } else {
        if (angka.isNotEmpty) {
          tokens.add(angka);
          angka = '';
        }
        tokens.add(char);
      }
    }
    if (angka.isNotEmpty) tokens.add(angka);

    // Step 1: tangani × dan ÷ lebih dulu
    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i] == '*' || tokens[i] == '/') {
        double kiri = double.parse(tokens[i - 1]);
        double kanan = double.parse(tokens[i + 1]);
        double hasilSementara =
            (tokens[i] == '*') ? kiri * kanan : kiri / kanan;
        tokens.replaceRange(i - 1, i + 2, [hasilSementara.toString()]);
        i -= 1;
      }
    }

    // Step 2: tangani + dan -
    double total = double.parse(tokens[0]);
    for (int i = 1; i < tokens.length; i += 2) {
      String op = tokens[i];
      double kanan = double.parse(tokens[i + 1]);
      if (op == '+') total += kanan;
      if (op == '-') total -= kanan;
    }

    return total;
  }

  // Widget pembuat tombol sederhana (kotak, tidak oval)
  Widget buatTombol(String teks, {Color? warna, Function()? onTekan}) {
    return SizedBox(
      width: 70,
      height: 60,
      child: ElevatedButton(
        onPressed: onTekan,
        style: ElevatedButton.styleFrom(
          backgroundColor: warna ?? Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: const BorderSide(color: Colors.black, width: 1),
          ),
        ),
        child: Text(
          teks,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Full'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tampilan layar kalkulator
              Container(
                height: 130,
                width: 300,
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        input,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      hasil,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Baris 7–9 dan ÷
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buatTombol('7', onTekan: () => tekanAngka('7')),
                  const SizedBox(width: 8),
                  buatTombol('8', onTekan: () => tekanAngka('8')),
                  const SizedBox(width: 8),
                  buatTombol('9', onTekan: () => tekanAngka('9')),
                  const SizedBox(width: 8),
                  buatTombol('÷',
                      warna: Colors.orange[200],
                      onTekan: () => tekanOperator('÷')),
                ],
              ),
              const SizedBox(height: 8),

              // Baris 4–6 dan ×
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buatTombol('4', onTekan: () => tekanAngka('4')),
                  const SizedBox(width: 8),
                  buatTombol('5', onTekan: () => tekanAngka('5')),
                  const SizedBox(width: 8),
                  buatTombol('6', onTekan: () => tekanAngka('6')),
                  const SizedBox(width: 8),
                  buatTombol('×',
                      warna: Colors.orange[200],
                      onTekan: () => tekanOperator('×')),
                ],
              ),
              const SizedBox(height: 8),

              // Baris 1–3 dan -
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buatTombol('1', onTekan: () => tekanAngka('1')),
                  const SizedBox(width: 8),
                  buatTombol('2', onTekan: () => tekanAngka('2')),
                  const SizedBox(width: 8),
                  buatTombol('3', onTekan: () => tekanAngka('3')),
                  const SizedBox(width: 8),
                  buatTombol('-',
                      warna: Colors.orange[200],
                      onTekan: () => tekanOperator('-')),
                ],
              ),
              const SizedBox(height: 8),

              // Baris C, 0, =, +
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buatTombol('C',
                      warna: Colors.red[200], onTekan: tekanClear),
                  const SizedBox(width: 8),
                  buatTombol('0', onTekan: () => tekanAngka('0')),
                  const SizedBox(width: 8),
                  buatTombol('=',
                      warna: Colors.green[200],
                      onTekan: tekanSamaDengan),
                  const SizedBox(width: 8),
                  buatTombol('+',
                      warna: Colors.orange[200],
                      onTekan: () => tekanOperator('+')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
