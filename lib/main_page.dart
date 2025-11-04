import 'package:flutter/material.dart';
import 'menu1.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman utama"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Menu1Page();
              }),
            );
          },
          child: Text("Next"),
        ),
      ),
    );
  }
}