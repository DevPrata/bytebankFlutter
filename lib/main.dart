import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      //Home: Permite indicar qualquer widget como primeira tela. no root do MaterialApp
      home: Scaffold(
        // Scaffold: Permitirá implementarmos toda a estrutura básica (ou esqueleto) do Material Design.

        body: ListaTransferencia(),

        //Navigation Bar no topo
        appBar: AppBar(
          title: Text('Transferências ',textDirection: TextDirection.ltr),
        ),

        floatingActionButton: FloatingActionButton(

          child: Icon(Icons.add),
        ),
      ),
    )
);

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(100.0, 1000)),
        ItemTransferencia(Transferencia(200.0, 1001)),
        ItemTransferencia(Transferencia(300.0, 1002)),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
    )
    );
  }
}


class Transferencia{
  final double valor;
  final int numeroConta;

  Transferencia(this.valor,this.numeroConta);
}