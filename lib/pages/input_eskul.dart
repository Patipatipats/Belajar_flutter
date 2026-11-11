
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:belajar_flutter/pages/eskulhasil.dart';

class FormEskul extends StatefulWidget {
  const FormEskul({super.key});

  @override
  State<FormEskul> createState() => _FormEskulState();
}

class _FormEskulState extends State<FormEskul> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController =
      TextEditingController();

  final TextEditingController teleponController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController tanggalController =
      TextEditingController();

  String? kelas;
  String? eskulError;

  List<String> eskulDipilih = [];

  final List<String> kelasList = [
    'X RPL 1',
    'X RPL 2',
    'XI RPL 1',
    'XI RPL 2',
    'XII RPL 1',
  ];

  final List<String> eskulList = [
    'Futsal',
    'Basket',
    'Voli',
    'Paskibra',
    'PMR',
    'Pramuka',
    'Musik',
    'English Club',
    'KIR',
    'Tari',
  ];

  @override
  void dispose() {
    namaController.dispose();
    teleponController.dispose();
    emailController.dispose();
    tanggalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran Eskul'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Form(
                key: _formKey,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // JUDUL
                    const Center(
                      child: Text(
                        'Formulir Pendaftaran',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Center(
                      child: Text(
                        'Ekstrakurikuler Sekolah',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // NAMA LENGKAP
                    const Text(
                      'Nama Lengkap',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: namaController,
                      keyboardType: TextInputType.name,

                      decoration: const InputDecoration(
                        hintText: 'Masukkan nama lengkap',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),

                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Nama lengkap wajib diisi';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // NOMOR TELEPON
                    const Text(
                      'No. Telepon',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: teleponController,
                      keyboardType: TextInputType.phone,

                      decoration: const InputDecoration(
                        hintText: 'Masukkan nomor telepon',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor telepon wajib diisi';
                        }

                        if (!RegExp(r'^[0-9+]+$').hasMatch(value)) {
                          return 'Nomor telepon tidak valid';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // EMAIL
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,

                      decoration: const InputDecoration(
                        hintText: 'Masukkan alamat email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email wajib diisi';
                        }

                        if (!RegExp(
                          r'^[^@]+@[^@]+\.[^@]+$',
                        ).hasMatch(value)) {
                          return 'Format email tidak valid';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // KELAS
                    const Text(
                      'Kelas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    DropdownButtonFormField<String>(
                      initialValue: kelas,

                      decoration: const InputDecoration(
                        hintText: 'Pilih kelas',
                        prefixIcon: Icon(Icons.school),
                        border: OutlineInputBorder(),
                      ),

                      items: kelasList.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),

                      onChanged: (value) {
                        setState(() {
                          kelas = value;
                        });
                      },

                      validator: (value) {
                        if (value == null) {
                          return 'Silakan pilih kelas';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // PILIH ESKUL
                    const Text(
                      'Pilihan Ekstrakurikuler',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Pilih minimal 1 dan maksimal 2 eskul.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 10),

                    ...eskulList.map((item) {
                      final isSelected =
                          eskulDipilih.contains(item);

                      final isDisabled =
                          eskulDipilih.length >= 2 &&
                          !isSelected;

                      return CheckboxListTile(
                        title: Text(item),
                        value: isSelected,
                        contentPadding: EdgeInsets.zero,

                        controlAffinity:
                            ListTileControlAffinity.leading,

                        onChanged: isDisabled
                            ? null
                            : (value) {
                                setState(() {
                                  if (value == true) {
                                    eskulDipilih.add(item);
                                  } else {
                                    eskulDipilih.remove(item);
                                  }

                                  eskulError = null;
                                });
                              },
                      );
                    }),

                    if (eskulError != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          eskulError!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),

                    const SizedBox(height: 20),

                    // TANGGAL PENDAFTARAN
                    const Text(
                      'Tanggal Pendaftaran',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: tanggalController,
                      readOnly: true,

                      decoration: const InputDecoration(
                        hintText: 'Pilih tanggal pendaftaran',
                        prefixIcon: Icon(Icons.calendar_month),
                        border: OutlineInputBorder(),
                      ),

                      onTap: () async {
                        DateTime? pickedDate =
                            await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            tanggalController.text =
                                DateFormat('dd-MM-yyyy')
                                    .format(pickedDate);
                          });
                        }
                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tanggal pendaftaran wajib diisi';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    // TOMBOL DAFTAR
                    SizedBox(
                      width: double.infinity,
                      height: 48,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          foregroundColor: Colors.white,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        onPressed: submit,

                        child: const Text(
                          'Daftar Sekarang',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // PROSES SUBMIT
  void submit() {
    final isValid = _formKey.currentState!.validate();

    if (eskulDipilih.isEmpty) {
      setState(() {
        eskulError = 'Pilih minimal 1 ekstrakurikuler';
      });
    }

    if (!isValid || eskulDipilih.isEmpty) {
      return;
    }

    // PINDAH KE HALAMAN OUTPUT
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputEskul(
          nama: namaController.text,
          telepon: teleponController.text,
          email: emailController.text,
          kelas: kelas!,
          eskul: List.from(eskulDipilih),
          tanggal: tanggalController.text,
        ),
      ),
    );
  }
}
