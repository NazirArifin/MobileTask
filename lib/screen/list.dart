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
        kode: 'dog', nama: 'Anjing', jenis: 'mamalia', jumlahKaki: 4
      ));
      _list.add(Animal(
        kode: 'cat', nama: 'Kucing', jenis: 'mamalia', jumlahKaki: 4
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
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/add');
              },
            ),
            _terpilih == null ? Container() : IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                
              },
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
                Navigator.pushNamed(context, '/detail', arguments: animal);
              },
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