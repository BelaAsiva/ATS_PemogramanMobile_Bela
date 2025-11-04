import 'package:flutter/material.dart';

class Menu2Home extends StatefulWidget {
  const Menu2Home({super.key});

  @override
  State<Menu2Home> createState() => _Menu2HomeState();
}

class _Menu2HomeState extends State<Menu2Home> {
  int _jumlah = 0; // variabel penampung angka

  void tambahAngka() {
    setState(() {
      _jumlah++; // menambah 1 setiap kali tombol ditekan
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu 2 Alat Dzikir'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'JUMLAH: $_jumlah', 
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: tambahAngka,
              child: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}
