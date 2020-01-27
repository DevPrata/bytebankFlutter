import 'package:flutter/material.dart';

const _tituloAppBar = 'Dashboard';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset("images/bytebank_logo.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.green[700],
                height: 100,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    Text(
                      'Contacts',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
