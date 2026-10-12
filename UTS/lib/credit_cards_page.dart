import 'package:flutter/material.dart';

class CreditCardsPage extends StatelessWidget {
  const CreditCardsPage({Key? key}) : super(key: key);

  // TODO 1: GANTI VARIABEL INI DENGAN DATA DIRI ANDA
  final String namaMahasiswa = "JUSTIN CHRISTIAN ADAM";
  final String nimMahasiswa = "20245520006";

  @override
  Widget build(BuildContext context) {
    // TODO 2: BUAT LOGIKA KONDISIONAL BERDASARKAN NIM!
    // Aturan:
    // - Jika digit terakhir NIM Anda Ganjil: warnaKartu1 = Biru (0xFF0B1033)
    // - Jika digit terakhir NIM Anda Genap: warnaKartu1 = Hitam (0xFF000000)
    int digitTerakhir = int.parse(nimMahasiswa[nimMahasiswa.length - 1]);
    Color warnaKartu1 = (digitTerakhir % 2 != 0)
        ? const Color(0xFF0B1033)
        : const Color(0xFF000000);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO 3: Implementasikan UI untuk judul dan sub-judul
                _buildTitleSection(
                  title: 'Rincian pembayaran',
                  subTitle: 'Bagaimana Anda ingin membayar?',
                ),
                const SizedBox(height: 24),

                // TODO 4: Bangun UI kartu kredit di sini
                // Kartu Pertama (Warna sesuai logika NIM)
                _buildCreditCard(
                  color: warnaKartu1,
                  cardNumber: '3546 7532 XXXX 9742',
                  cardHolder: namaMahasiswa,
                  cardExpiration: '08/2022',
                ),
                const SizedBox(height: 16),

                // Kartu Kedua
                _buildCreditCard(
                  color: const Color(0xFF000000),
                  cardNumber: '9874 4785 XXXX 6548',
                  cardHolder: namaMahasiswa,
                  cardExpiration: '05/2024',
                ),
                const SizedBox(height: 24),

                // Tombol Tambah Kartu
                Center(
                  child: _buildAddCardButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // =========================================================================
  // PERINGATAN: DILARANG MENGUBAH NAMA FUNGSI DAN PARAMETER DI BAWAH INI
  // =========================================================================

  // TODO 3: Implementasikan UI untuk judul dan sub-judul di sini
  Column _buildTitleSection({
    required String title,
    required String subTitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF222222),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // TODO 4: Implementasikan UI Kartu Kredit
  Card _buildCreditCard({
    required Color color,
    required String cardNumber,
    required String cardHolder,
    required String cardExpiration,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: color,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogosBlock(),
            Text(
              cardNumber,
              style: const TextStyle(
                fontFamily: 'CourierPrime',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetailsBlock(
                  label: 'CARDHOLDER',
                  value: cardHolder,
                ),
                _buildDetailsBlock(
                  label: 'VALID THRU',
                  value: cardExpiration,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // TODO 5: Panggil asset gambar lokal "contact_less.png" dan "mastercard.png"
  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/contact_less.png',
          height: 28,
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/images/mastercard.png',
          height: 28,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  // Implementasikan Details Block
  Column _buildDetailsBlock({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  // Implementasikan Tombol Tambah Kartu
  Container _buildAddCardButton({
    required Icon icon,
    required Color color,
  }) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: icon),
    );
  }
}