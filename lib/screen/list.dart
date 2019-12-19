import 'package:flutter/material.dart';
import 'package:newapp/shared/animal.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Animal> _list = [];
  Animal _terpilih;

  @override
  void initState() {
    super.initState();

    setState(() {
      _list.add(Animal(
        id: 1, kode: 'dog', nama: 'Anjing', jenis: 'mamalia', jumlahKaki: 4
      ));
      _list.add(Animal(
        id: 2, kode: 'cat', nama: 'Kucing', jenis: 'mamalia', jumlahKaki: 4
      ));
      _list.add(Animal(
        id: 3, kode: 'lion', nama: 'Singa', jenis: 'mamalia', jumlahKaki: 4
      ));
      _list.add(Animal(
        id: 4, kode: 'fish', nama: 'Ikan', jenis: 'ikan', jumlahKaki: 0
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() {
          if (_terpilih != null) {
            setState(() {
              _terpilih = null;
            });
            return false;
          }
          return true;
        });
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final dynamic hasil = await Navigator.pushNamed(context, '/add');
            if (hasil != null) {
              setState(() {
                _list.add(hasil);
              });
            }
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
        appBar: AppBar(
          title: Text('Animals'),
          actions: <Widget>[
            AnimatedOpacity(
              duration: Duration(milliseconds: 700),
              opacity: _terpilih == null ? 0 : 1,
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () async {
                  final dynamic result = await Navigator.pushNamed(context, '/add', arguments: _terpilih);
                  if (result != null) {
                    setState(() {
                      // remove yang idnya sama
                      final index = _list.indexWhere((v) => result.id == v.id);
                      _list[index] = result;
                      _terpilih = null;
                    });
                  }
                },
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 700),
              opacity: _terpilih == null ? 0 : 1,
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _list.removeWhere((a) => a.id == _terpilih.id);
                    _terpilih = null;
                  });
                },
              ),
            )
          ],
        ),
        body: ListView.separated(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            var animal = _list[index];

            return GestureDetector(
              onLongPress: () {
                setState(() {
                  _terpilih = animal;
                });
              },
              onTap: () {
                if (_terpilih != null) {
                  setState(() {
                    _terpilih = null;
                  });
                } else {
                  Navigator.pushNamed(context, '/detail', arguments: animal);
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 700),
                color: _terpilih != null && _terpilih.id == animal.id ? Colors.blue.shade100 : Colors.transparent,
                child: ListTile(
                  leading: Hero(
                    tag: animal,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      backgroundImage: NetworkImage('https://loremflickr.com/480/480/' + animal.kode)
                    ),
                  ),
                  title: Text(animal.nama),
                  trailing: Text('${animal.jumlahKaki}', style: TextStyle(
                    fontSize: 30
                  )),
                  subtitle: Text('Jenis: ' + animal.jenis),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }
}