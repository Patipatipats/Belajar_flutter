
import 'package:flutter/material.dart';

class OutputEskul extends StatelessWidget {
  final String nama;
  final String telepon;
  final String email;
  final String kelas;
  final List<String> eskul;
  final String tanggal;

  const OutputEskul({
    super.key,
    required this.nama,
    required this.telepon,
    required this.email,
    required this.kelas,
    required this.eskul,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        title: const Text('Data Pendaftaran'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              const SizedBox(height: 20),

              // ICON BERHASIL
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),

              const SizedBox(height: 15),

              const Text(
                'Pendaftaran Berhasil!',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Berikut adalah detail pendaftaran ekstrakurikuler kamu.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 30),

              // CARD DETAIL
              Card(
                elevation: 3,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'DETAIL PENDAFTARAN',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),

                      const Divider(height: 30),

                      _dataWidget(
                        'Nama Lengkap',
                        nama,
                      ),

                      _dataWidget(
                        'No. Telepon',
                        telepon,
                      ),

                      _dataWidget(
                        'Email',
                        email,
                      ),

                      _dataWidget(
                        'Kelas',
                        kelas,
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        'Ekstrakurikuler Dipilih:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // DAFTAR ESKUL
                      ...eskul.map(
                        (item) => Container(
                          margin: const EdgeInsets.only(bottom: 8),

                          padding: const EdgeInsets.all(10),

                          decoration: BoxDecoration(
                            color: Colors.green.withValues(
                              alpha: 0.08,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 20,
                              ),

                              const SizedBox(width: 10),

                              Text(
                                item,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      _dataWidget(
                        'Tanggal Pendaftaran',
                        tanggal,
                      ),

                      const Divider(height: 30),

                      const Center(
                        child: Text(
                          'Terima kasih telah mendaftar!',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // TOMBOL KEMBALI
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.popUntil(
                      context,
                      (route) => route.isFirst,
                    );
                  },

                  icon: const Icon(Icons.home),

                  label: const Text(
                    'Kembali ke Beranda',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // WIDGET MENAMPILKAN DATA
  Widget _dataWidget(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            width: 135,

            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),

          const Text(': '),

          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
