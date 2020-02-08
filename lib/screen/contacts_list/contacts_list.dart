import 'package:flutter/material.dart';

const _tituloAppBar = 'Contatos';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),

      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text("Guilherme"),
              subtitle: Text("ALOOO"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>{},
        child: Icon(Icons.add),
      ),
    );
  }
}
