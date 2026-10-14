
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // Key untuk validasi Form
  final _formkey = GlobalKey<FormState>();

  // Controller textbox
  final TextEditingController _nameController =
      TextEditingController();

  final TextEditingController _alamatController =
      TextEditingController();

  // Variabel biodata
  DateTime? _tanggalLahir;
  String? _jenisKelamin;
  String? _agama;

  // Daftar agama
  final List<String> _daftarAgama = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Buddha',
    'Konghucu',
    'Lainnya',
  ];

  // Variabel hasil biodata
  String namaLengkap = '';
  String tanggalLahir = '';
  String jenisKelamin = '';
  String alamat = '';
  String agama = '';

  @override
  void dispose() {
    // Menghapus inputan yang sudah diisi
    _nameController.dispose();
    _alamatController.dispose();

    // Mengeksekusi method dispose
    super.dispose();
  }

  // Method Date Picker
  Future<void> _pilihTanggalLahir() async {
    final DateTime? tanggal = await showDatePicker(
      context: context,
      initialDate: DateTime(2008),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (tanggal != null) {
      setState(() {
        _tanggalLahir = tanggal;
      });
    }
  }

  // Method Submit Form
  void _submitForm() {
    if (_formkey.currentState!.validate()) {
      // Validasi tanggal lahir
      if (_tanggalLahir == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Silakan pilih tanggal lahir'),
          ),
        );
        return;
      }

      // Validasi jenis kelamin
      if (_jenisKelamin == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Silakan pilih jenis kelamin'),
          ),
        );
        return;
      }

      // Validasi agama
      if (_agama == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Silakan pilih agama'),
          ),
        );
        return;
      }

      // Menyimpan hasil biodata
      setState(() {
        namaLengkap = _nameController.text.trim();

        tanggalLahir =
            '${_tanggalLahir!.day}/'
            '${_tanggalLahir!.month}/'
            '${_tanggalLahir!.year}';

        jenisKelamin = _jenisKelamin!;
        alamat = _alamatController.text.trim();
        agama = _agama!;
      });

      print('Nama: $namaLengkap');
      print('Tanggal Lahir: $tanggalLahir');
      print('Jenis Kelamin: $jenisKelamin');
      print('Alamat: $alamat');
      print('Agama: $agama');

      // Menampilkan hasil biodata
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Hasil Biodata'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Nama: $namaLengkap'),
                  const SizedBox(height: 8),
                  Text('Tanggal Lahir: $tanggalLahir'),
                  const SizedBox(height: 8),
                  Text('Jenis Kelamin: $jenisKelamin'),
                  const SizedBox(height: 8),
                  Text('Alamat: $alamat'),
                  const SizedBox(height: 8),
                  Text('Agama: $agama'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Tutup'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Biodata'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formkey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NAMA LENGKAP
              const Text(
                'Nama Lengkap',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 16,
                ),
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your name',
                    hintText: 'Nama lengkap',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),

              // TANGGAL LAHIR
              const Text(
                'Tanggal Lahir',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 16,
                ),
                child: InkWell(
                  onTap: _pilihTanggalLahir,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Pilih tanggal lahir',
                      border: OutlineInputBorder(),
                    ),
                    child: Text(
                      _tanggalLahir == null
                          ? 'Belum memilih tanggal'
                          : '${_tanggalLahir!.day}/'
                            '${_tanggalLahir!.month}/'
                            '${_tanggalLahir!.year}',
                    ),
                  ),
                ),
              ),

              // JENIS KELAMIN
              const Text(
                'Jenis Kelamin',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              RadioListTile<String>(
                title: const Text('Laki-laki'),
                value: 'Laki-laki',
                groupValue: _jenisKelamin,
                onChanged: (value) {
                  setState(() {
                    _jenisKelamin = value;
                  });
                },
              ),

              RadioListTile<String>(
                title: const Text('Perempuan'),
                value: 'Perempuan',
                groupValue: _jenisKelamin,
                onChanged: (value) {
                  setState(() {
                    _jenisKelamin = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              // ALAMAT
              const Text(
                'Alamat',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 16,
                ),
                child: TextFormField(
                  controller: _alamatController,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    labelText: 'Masukkan alamat',
                    hintText: 'Alamat lengkap',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),

              // AGAMA
              const Text(
                'Agama',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 24,
                ),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Pilih agama',
                    border: OutlineInputBorder(),
                  ),
                  items: _daftarAgama.map((agama) {
                    return DropdownMenuItem<String>(
                      value: agama,
                      child: Text(agama),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _agama = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Silakan pilih agama';
                    }
                    return null;
                  },
                ),
              ),

              // TOMBOL SUBMIT
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _submitForm,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                  child: const Text(
                    'Submit Biodata',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // HASIL BIODATA DI HALAMAN
              if (namaLengkap.isNotEmpty) ...[
                const Divider(),

                const Text(
                  'Biodata Tersimpan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text('Nama Lengkap: $namaLengkap'),
                Text('Tanggal Lahir: $tanggalLahir'),
                Text('Jenis Kelamin: $jenisKelamin'),
                Text('Alamat: $alamat'),
                Text('Agama: $agama'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
