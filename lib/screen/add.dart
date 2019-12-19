import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newapp/shared/animal.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _kodeController = TextEditingController();
  final _jenisController = TextEditingController();
  final _kakiController = TextEditingController();

  Animal _diedit;
  _setAnimal(Animal a) {
    setState(() {
      _diedit = a;
      _kodeController.text = a.kode;
      _namaController.text = a.nama;
      _jenisController.text = a.jenis;
      _kakiController.text = a.jumlahKaki.toString();
    });
  }

  @override
  void dispose() {
    _kodeController.dispose();
    _namaController.dispose();
    _jenisController.dispose();
    _kakiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animal args = ModalRoute.of(context).settings.arguments;
    if (args != null) {
      _setAnimal(args);
    }

    return Scaffold(
      appBar: AppBar(
        title: _diedit == null ? Text('Tambah Animal') : Text('Edit Animal'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // judul
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text((_diedit != null ? 'Edit' : 'Tambah') + ' Animal', style: TextStyle(
                    fontSize: 24
                  ), textAlign: TextAlign.center),
                ),

                // input kode
                TextFormField(
                  controller: _kodeController,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Kode'
                  )
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
                        var rng = new Random();

                        var kodenya = _kodeController.text;
                        var namanya = _namaController.text;
                        var jenis = _jenisController.text;
                        var kaki = _kakiController.text;
                        var animal = Animal(
                          id: _diedit != null ? _diedit.id : rng.nextInt(1000),
                          nama: namanya, 
                          jenis: jenis, 
                          kode: kodenya,
                          jumlahKaki: int.parse(kaki)
                        );
                        Navigator.pop(context, animal);
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
      ),
    );
  }
}