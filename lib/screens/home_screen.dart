import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Pastikan ini sudah diimpor
import '../widgets/umkm_card.dart';
import 'map_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> umkmList = const [
    {
      'name': 'Etek Geprek',
      'address': 'Jl. Sumangkut, Tigo Jangko, Lintau Buo',
      'rating': 5,
      'image': 'assets/etek_geprek.png',
      'phone': '6281234567890',
    },
    {
      'name': 'Geprek Nusantara',
      'address': 'Jl. Sumangkut, Tigo Jangko, Lintau Buo',
      'rating': 4,
      'image': 'assets/geprek_nusantara.png',
      'phone': '6289876543210',
    },
    {
      'name': 'Cindomato',
      'address': 'Jl. Sumangkut, Tigo Jangko, Lintau Buo',
      'rating': 4,
      'image': 'assets/cindomato.png',
      'phone': '6281122334455',
    },
    {
      'name': 'Oishi',
      'address': 'Jl. Sumangkut, Tigo Jangko, Lintau Buo',
      'rating': 4,
      'image': 'assets/oishi.png',
      'phone': '6285566778899',
    },
  ];

  // Tambahkan metode _launchURL untuk memanggil WhatsApp
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // Buat URI dari teks
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak dapat membuka $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lintau Food'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: umkmList.length,
        itemBuilder: (context, index) {
          final umkm = umkmList[index];
          return UMKMCard(
            name: umkm['name'],
            address: umkm['address'],
            rating: umkm['rating'],
            image: umkm['image'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapScreen(
                    umkmName: umkm['name'],
                    address: umkm['address'],
                  ),
                ),
              );
            },
            onOrder: () {
              // Membuka WhatsApp dengan teks otomatis
              final text =
                  "Halo ${umkm['name']}, saya ingin memesan makanan dari UMKM Anda.";
              final url =
                  'https://wa.me/${umkm['phone']}?text=${Uri.encodeComponent(text)}';
              _launchURL(url); // Panggil metode _launchURL
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Bantuan'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
        ],
      ),
    );
  }
}
