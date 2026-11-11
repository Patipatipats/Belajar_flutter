import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StrukPembayaran extends StatelessWidget {
  final Map<String, dynamic> destination;
  final int quantity;
  final int paymentMethod;
  final int total;
  final int cash;
  final int change;

  const StrukPembayaran({
    super.key,
    required this.destination,
    required this.quantity,
    required this.paymentMethod,
    required this.total,
    required this.cash,
    required this.change,
  });

  String getData(String key, [String fallback = '-']) {
    final value = destination[key];
    if (value == null || value.toString().isEmpty) {
      return fallback;
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );

    const orange = Color(0xFFFF9800);
    const background = Color(0xFFFFFBF5);

    final String namaWisata = getData('name', 'Wisata');
    final String lokasi = getData('location', '-');
    final String metodeStr = paymentMethod == 0 ? 'Cash (Tunai)' : 'QRIS';
    final String tanggalSekarang = DateFormat('dd MMM yyyy, HH:mm').format(DateTime.now());
    final String trxId = 'TRX-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}';

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Payment Receipt',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            // ICON BERHASIL
            Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_rounded,
                color: Colors.green,
                size: 60,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Payment Successful!',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              'Pembayaran tiket wisata berhasil',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 25),

            // STRUK CONTAINER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER STRUK
                  Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.travel_explore,
                          color: orange,
                          size: 42,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'TRAVEL TICKET',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Your journey starts here',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  _divider(),
                  const SizedBox(height: 18),

                  // NOMOR TRANSAKSI & TANGGAL
                  _rowInfo('Transaction ID', trxId),
                  const SizedBox(height: 12),
                  _rowInfo('Tanggal', tanggalSekarang),
                  const SizedBox(height: 18),
                  _divider(),
                  const SizedBox(height: 18),

                  // DETAIL WISATA
                  const Text(
                    'Destination Details',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    namaWisata,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: orange,
                        size: 17,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          lokasi,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _divider(),
                  const SizedBox(height: 18),

                  // RINCIAN PEMBAYARAN
                  const Text(
                    'Payment Details',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _rowInfo('Jumlah tiket', '$quantity tiket'),
                  const SizedBox(height: 12),
                  _rowInfo('Metode pembayaran', metodeStr),
                  const SizedBox(height: 12),
                  if (paymentMethod == 0) ...[
                    _rowInfo('Uang Diterima', currency.format(cash)),
                    const SizedBox(height: 12),
                    _rowInfo('Kembalian', currency.format(change)),
                    const SizedBox(height: 12),
                  ],
                  const SizedBox(height: 6),
                  _divider(),
                  const SizedBox(height: 18),
                  _rowInfo(
                    'Total pembayaran',
                    currency.format(total),
                    isBold: true,
                    valueColor: orange,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // TOMBOL KEMBALI KE HOME / SELESAI
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Selesai',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
    );
  }

  Widget _rowInfo(String label, String value, {bool isBold = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 13,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            fontSize: isBold ? 16 : 13,
            color: valueColor ?? Colors.black87,
          ),
        ),
      ],
    );
  }
}