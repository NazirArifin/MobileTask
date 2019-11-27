import 'package:flutter/material.dart';

class Animal {
  Animal({
    @required this.kode,
    @required this.nama,
    @required this.jenis,
    @required this.jumlahKaki,
  });

  final String kode;
  final String nama;
  final String jenis;
  final int jumlahKaki;
}