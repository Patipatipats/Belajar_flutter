import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugasai/strukpembayaran.dart';

class DetailWisata extends StatefulWidget {
  final Map<String, dynamic> destination;

  const DetailWisata({
    super.key,
    required this.destination,
  });

  @override
  State<DetailWisata> createState() => _DetailWisataState();
}

class _DetailWisataState extends State<DetailWisata> {
  int quantity = 1;
  int paymentMethod = 0;

  final TextEditingController cashController = TextEditingController();
  final Color orange = const Color(0xFFFF9800);

  // Mengambil harga dengan aman
  int get price {
    final value = widget.destination['price'];

    if (value == null) return 0;

    if (value is num) {
      return value.toInt();
    }

    final cleaned = value.toString().replaceAll(
      RegExp(r'[^0-9]'),
      '',
    );

    return int.tryParse(cleaned) ?? 0;
  }

  // Total pembayaran
  int get total => price * quantity;

  // Uang cash
  int get cash {
    final cleaned = cashController.text.replaceAll(
      RegExp(r'[^0-9]'),
      '',
    );

    return int.tryParse(cleaned) ?? 0;
  }

  // Kembalian
  int get change => cash - total;

  // Format rupiah
  String formatRupiah(int value) {
    final text = value.toString();
    final result = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      result.write(text[i]);

      final remaining = text.length - i - 1;

      if (remaining > 0 && remaining % 3 == 0) {
        result.write('.');
      }
    }

    return 'Rp$result';
  }

  // Mengambil data teks dengan aman
  String getData(String key, [String fallback = '-']) {
    final value = widget.destination[key];

    if (value == null || value.toString().isEmpty) {
      return fallback;
    }

    return value.toString();
  }

  // Navigasi ke halaman struk
  void checkout() {
    if (price <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harga wisata tidak valid!'),
        ),
      );
      return;
    }

    // Validasi pembayaran cash
    if (paymentMethod == 0 && cash < total) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nominal cash belum mencukupi!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Navigasi ke struk pembayaran
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => StrukPembayaran(
          destination: widget.destination,
          quantity: quantity,
          paymentMethod: paymentMethod,
          total: total,
          cash: paymentMethod == 0 ? cash : 0,
          change: paymentMethod == 0 ? change : 0,
        ),
      ),
    );
  }

  @override
  void dispose() {
    cashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final image = getData('image', '');

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF5),
      body: SafeArea(
        child: Column(
          children: [
            // KONTEN UTAMA
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HEADER
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          _circleButton(
                            Icons.arrow_back_ios_new_rounded,
                            () => Navigator.pop(context),
                          ),
                          const Spacer(),
                          const Text(
                            'Booking Details',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          _circleButton(
                            Icons.share_outlined,
                            () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Share wisata'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    // GAMBAR WISATA
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: image.isNotEmpty
                            ? Image.network(
                                image,
                                width: double.infinity,
                                height: 220,
                                fit: BoxFit.cover,
                                errorBuilder: (
                                  context,
                                  error,
                                  stackTrace,
                                ) {
                                  return _imagePlaceholder();
                                },
                              )
                            : _imagePlaceholder(),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // INFORMASI WISATA
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  getData('name', 'Wisata'),
                                  style: const TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                getData('rating', '0.0'),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 7),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: orange,
                                size: 17,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  getData('location'),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'A beautiful destination waiting for you. '
                            'Enjoy an unforgettable journey and explore '
                            'the natural beauty of Indonesia.',
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.6,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // JUMLAH TIKET
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(17),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Jumlah Tiket',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '${formatRupiah(price)} / orang',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _quantityButton(
                              Icons.remove,
                              () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 17,
                              ),
                              child: Text(
                                '$quantity',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            _quantityButton(
                              Icons.add,
                              () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // METODE PEMBAYARAN
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 22,
                      ),
                      child: Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: _paymentCard(
                              index: 0,
                              icon: Icons.payments_outlined,
                              title: 'Cash',
                              subtitle: 'Tunai',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _paymentCard(
                              index: 1,
                              icon: Icons.qr_code_2_rounded,
                              title: 'QRIS',
                              subtitle: 'Scan QR',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 17),

                    // PEMBAYARAN CASH
                    if (paymentMethod == 0)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Jumlah uang diterima',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                controller: cashController,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  prefixText: 'Rp ',
                                  hintText: 'Masukkan nominal cash',
                                  filled: true,
                                  fillColor: const Color(0xFFFFFBF5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              _paymentInfo(
                                'Total pembayaran',
                                formatRupiah(total),
                              ),
                              const SizedBox(height: 10),
                              _paymentInfo(
                                'Kembalian',
                                formatRupiah(
                                  change > 0 ? change : 0,
                                ),
                                valueColor: Colors.green.shade700,
                              ),
                              if (cash > 0 && cash < total) ...[
                                const SizedBox(height: 10),
                                const Text(
                                  'Uang yang dimasukkan belum cukup.',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),

                    // PEMBAYARAN QRIS
                    if (paymentMethod == 1)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Scan QRIS untuk membayar',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(
                                  Icons.qr_code_2_rounded,
                                  size: 155,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                formatRupiah(total),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: orange,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'QRIS DEMO - Bukan kode pembayaran asli',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),

            // BOTTOM CHECKOUT
            Container(
              padding: const EdgeInsets.fromLTRB(22, 15, 22, 18),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Total pembayaran',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          formatRupiah(total),
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 165,
                    height: 49,
                    child: ElevatedButton(
                      onPressed: checkout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orange,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // PLACEHOLDER GAMBAR
  Widget _imagePlaceholder() {
    return Container(
      width: double.infinity,
      height: 220,
      color: Colors.orange.shade100,
      child: const Center(
        child: Icon(
          Icons.landscape,
          size: 60,
          color: Colors.orange,
        ),
      ),
    );
  }

  // INFORMASI PEMBAYARAN
  Widget _paymentInfo(
    String title,
    String value, {
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }

  // TOMBOL HEADER
  Widget _circleButton(
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
        ),
      ),
    );
  }

  // TOMBOL JUMLAH TIKET
  Widget _quantityButton(
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3E0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: orange,
          size: 19,
        ),
      ),
    );
  }

  // KARTU METODE PEMBAYARAN
  Widget _paymentCard({
    required int index,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final selected = paymentMethod == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          paymentMethod = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFFF3E0) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? orange : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: orange,
              size: 27,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}