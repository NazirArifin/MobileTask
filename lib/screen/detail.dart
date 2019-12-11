import 'package:flutter/material.dart';
import 'package:newapp/shared/animal.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Animal args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.nama),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // gambar icon besar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
              child: Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage('https://loremflickr.com/480/480/' + args.kode),
                ),
              ),
            ),

            // Teks Utama
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(args.nama, style: TextStyle(
                fontSize: 35
              )),
            ),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: Divider(),
            ),

            // List Keterangan
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  ListTile(
                    subtitle: Text('Jenis'),
                    title: Text(args.jenis.toUpperCase()),
                  ),
                  ListTile(
                    subtitle: Text('Jumlah Kaki'),
                    title: Text(args.jumlahKaki.toString()),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}