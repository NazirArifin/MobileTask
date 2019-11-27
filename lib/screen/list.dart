import 'package:flutter/material.dart';
import 'package:newapp/shared/animal.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Animal> _list = [];

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Animals'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
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
                _list.removeAt(index);
              });
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage('https://loremflickr.com/480/480/' + animal.kode)
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
    );
  }
}