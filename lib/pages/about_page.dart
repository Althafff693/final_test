import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tentang')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/profile.jpg')),
            SizedBox(height: 20),
            Text('Nama: John Doe', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Konversi Mata Uang'),
              onTap: () {
                // Navigasi ke halaman konversi mata uang
              },
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Konversi Waktu'),
              onTap: () {
                // Navigasi ke halaman konversi waktu
              },
            ),
          ],
        ),
      ),
    );
  }
}
