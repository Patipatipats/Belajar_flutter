
import 'package:flutter/material.dart';

class Latihan3 extends StatelessWidget {
  const Latihan3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan 3'),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 50,
                color: const Color.fromARGB(255, 21, 255, 0),
                alignment: Alignment.center,
                child: const Text('Pemasukan'),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Container(
                height: 50,
                color: const Color.fromARGB(255, 247, 0, 255),
                alignment: Alignment.center,
                child: const Text('Pengeluaran'),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Container(
                height: 50,
                color: const Color.fromARGB(255, 78, 76, 175),
                alignment: Alignment.center,
                child: const Text('Saldo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
