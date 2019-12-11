import 'package:flutter/material.dart';
import 'package:newapp/shared/animal.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _jenisController = TextEditingController();
  final _kakiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Animal'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // judul
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text('Tambah Animal', style: TextStyle(
                  fontSize: 24
                ), textAlign: TextAlign.center),
              ),

              // input nama
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Masukkan Nama'
                ),
              ),

              // input jenis
              TextFormField(
                controller: _jenisController,
                decoration: InputDecoration(
                  labelText: 'Masukkan Jenis'
                ),
              ),

              // input kaki
              TextFormField(
                controller: _kakiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan Kaki'
                ),
              ),

              // tombol
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    onPressed: () {
                      var namanya = _namaController.text;
                      var jenis = _jenisController.text;
                      var kaki = _kakiController.text;
                      var animal = Animal(
                        nama: namanya, 
                        jenis: jenis, 
                        kode: 'cat', 
                        jumlahKaki: int.parse(kaki)
                      );
                      Navigator.pop(context, animal);

                      print('Binatang dengan nama: ' + namanya + ' jenis: ' + jenis + ' kakinya: ' + kaki);
                    },
                    child: Text('SIMPAN'),
                    color: Colors.blue, textColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}