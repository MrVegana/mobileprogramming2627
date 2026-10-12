import 'package:flutter/material.dart';

class CreditCardsPage extends StatelessWidget {
  
  // TODO 1: GANTI VARIABEL INI DENGAN DATA DIRI ANDA
  final String namaMahasiswa = "Justin Christian Adam"; // Jangan biarkan kosong!
  final String nimMahasiswa = "20245520006"; // Jangan biarkan kosong!

  @override
  Widget build(BuildContext context) {
    
    // TODO 2: BUAT LOGIKA KONDISIONAL BERDASARKAN NIM!
    // Aturan:
    // - Jika digit terakhir NIM Anda Ganjil: warnaKartu1 = Biru (0xFF090943), warnaKartu2 = Merah.
    // - Jika digit terakhir NIM Anda Genap: warnaKartu1 = Hitam (0xFF000000), warnaKartu2 = Hijau.
    // (Silakan tulis kode logika if-else Anda di sini sebelum return)
    
    Color warnaKartu1;
    Color warnaKartu2;

    // Mengambil digit terakhir dari NIM (Angka 6 dari 20245520006 -> Genap)
    int lastDigit = int.parse(nimMahasiswa[nimMahasiswa.length - 1]);

    if (lastDigit % 2 != 0) {
      // NIM Ganjil
      warnaKartu1 = const Color(0xFF090943);
      warnaKartu2 = Colors.red;
    } else {
      // NIM Genap (NIM 20245520006 berakhir angka 6 -> Genap)
      warnaKartu1 = const Color(0xFF000000);
      warnaKartu2 = Colors.green;
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitleSection(
                title: "Rincian pembayaran",
                subTitle: "Bagaimana Anda ingin membayar?"),
            
            _buildCreditCard(
                color: warnaKartu1, 
                cardExpiration: "08/2026",
                cardHolder: namaMahasiswa, // Menggunakan variabel nama
                cardNumber: nimMahasiswa), // Menggunakan variabel NIM
            
            const SizedBox(
              height: 15,
            ),
            
            _buildCreditCard(
                color: warnaKartu2,
                cardExpiration: "05/2027",
                cardHolder: namaMahasiswa,
                cardNumber: "9874 4785 XXXX 6548"),
            
            _buildAddCardButton(
              icon: const Icon(Icons.add),
              color: const Color(0xFF081603),
            )
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // PERINGATAN: DILARANG MENGUBAH NAMA FUNGSI DAN PARAMETER DI BAWAH INI!
  // JIKA ANDA MENGGUNAKAN AI GENERATOR SEPENUHNYA, STRUKTUR INI BIASANYA AKAN RUSAK.
  // ===========================================================================

  // Build the title section
  Column _buildTitleSection({required String title, required String subTitle}) {
    // TODO 3: Implementasikan UI untuk judul dan sub-judul di sini.
    // Terapkan TextStyle dengan font yang sesuai panduan.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // padding 1 
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF222222),
            ),
          ),
        ),
        // padding 2
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            subTitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  // Build the credit card widget
  Card _buildCreditCard({ 
      required Color color,
      required String cardNumber,
      required String cardHolder,
      required String cardExpiration }) {
    
    // TODO 4: Bangun UI kartu kredit di sini.
    // Wajib memanggil fungsi _buildLogosBlock() dan _buildDetailsBlock() di dalamnya.
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: color,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
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
              children: <Widget>[
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

  // Column berisi kontainer dan Informasi (Details Block)
  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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

  // FloatingActionButton / AddCardButton
  Widget _buildAddCardButton({required Icon icon, required Color color}) {
    return Center(
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: icon),
      ),
    );
  }

  // buat  top row containing logo
  Row _buildLogosBlock() {
    // TODO 5: Panggil asset gambar lokal "contact_less.png" dan "mastercard.png".
    // CATATAN: Atur posisi sejajar berlawanan (kiri dan kanan). 
    // AI teks tidak tahu dimensi resolusi asli gambar ini. Anda harus mengatur nilai width dan height 
    // secara manual agar gambar tidak pecah atau overflow (terpotong).
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
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