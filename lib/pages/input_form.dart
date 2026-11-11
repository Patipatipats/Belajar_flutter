import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'output_form.dart';

class BelajarForm extends StatefulWidget {
  const BelajarForm({super.key});

  @override
  State<BelajarForm> createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController tempatLahirController =
      TextEditingController();
  final TextEditingController tglLahirController =
      TextEditingController();

  String jk = "";
  String? jkError;
  String? agama;

  final List<String> agamaList = [
    "Islam",
    "Protestan",
    "Katolik",
    "Budha",
    "Hindu",
  ];

  @override
  void dispose() {
    namaController.dispose();
    tempatLahirController.dispose();
    tglLahirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.blueGrey,
          child: Center(
            child: SingleChildScrollView(
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "Formulir Biodata",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Nama
                        TextFormField(
                          controller: namaController,
                          decoration: const InputDecoration(
                            hintText: "Nama Lengkap",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Input Nama";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Jenis Kelamin
                        const Text(
                          "Jenis Kelamin",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        RadioListTile<String>(
                          title: const Text("Laki-laki"),
                          value: "Laki-laki",
                          groupValue: jk,
                          contentPadding: EdgeInsets.zero,
                          onChanged: (value) {
                            setState(() {
                              jk = value!;
                              jkError = null;
                            });
                          },
                        ),

                        RadioListTile<String>(
                          title: const Text("Perempuan"),
                          value: "Perempuan",
                          groupValue: jk,
                          contentPadding: EdgeInsets.zero,
                          onChanged: (value) {
                            setState(() {
                              jk = value!;
                              jkError = null;
                            });
                          },
                        ),

                        if (jkError != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              jkError!,
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),

                        const SizedBox(height: 20),

                        // Tempat Lahir
                        TextFormField(
                          controller: tempatLahirController,
                          decoration: const InputDecoration(
                            hintText: "Tempat Lahir",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Input Tempat Lahir";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Tanggal Lahir
                        TextFormField(
                          controller: tglLahirController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: "Tanggal Lahir",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_month),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Input Tanggal Lahir";
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime? pickedDate =
                                await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (pickedDate != null) {
                              setState(() {
                                tglLahirController.text =
                                    DateFormat('yyyy-MM-dd')
                                        .format(pickedDate);
                              });
                            }
                          },
                        ),

                        const SizedBox(height: 20),

                        // Agama
                        DropdownButtonFormField<String>(
                          value: agama,
                          decoration: const InputDecoration(
                            labelText: "Pilih Agama",
                            border: OutlineInputBorder(),
                          ),
                          items: agamaList.map((item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              agama = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Pilih Agama";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 24),

                        // Tombol Simpan
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: submit,
                            child: const Text(
                              "Simpan",
                              style: TextStyle(
                                color: Colors.white,
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
        ),
      ),
    );
  }

  void submit() {
    final isValid = _formKey.currentState!.validate();

    if (jk.isEmpty) {
      setState(() {
        jkError = "Pilih Jenis Kelamin";
      });
    }

    if (!isValid || jk.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputFormScreen(
          nama: namaController.text,
          jk: jk,
          tempatLahir: tempatLahirController.text,
          tglLahir: tglLahirController.text,
          agama: agama!,
        ),
      ),
    );
  }
}