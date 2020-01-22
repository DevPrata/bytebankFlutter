import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Home: Permite indicar qualquer widget como primeira tela. no root do MaterialApp
      home: Scaffold(
        // Scaffold: Permitirá implementarmos toda a estrutura básica (ou esqueleto) do Material Design.

        //Corpo do aplicativo
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Criando transferência'),
        leading: Icon(
          Icons.navigate_before,
          size: 40,
        ),
        backgroundColor: Colors.green,

      ),
      body: Column(
        children: <Widget>[

          Editor(
              controlador: _controladorCampoNumeroConta,
              placeholder: 'Número da conta',
              dica: '0000'
          ),

          Editor(
              controlador: _controladorCampoValor,
              placeholder: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on
          ),

          RaisedButton(
            onPressed: () => _criaTransferencia(context),
            child: Text('Confirmar'),
            padding: const EdgeInsets.fromLTRB(90.0, 18.0, 90, 12.0),
          )

        ],

      ),
    );
  }

  //Context é necessario para ultilizar o SnackBar
  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);

      final snackBar = SnackBar(content: Text('$transferenciaCriada'), duration: Duration(seconds: 5),);
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String placeholder;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.placeholder, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 18.0, 40.0, 12.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: placeholder,
            hintText: dica
        ),
      ),

    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Navigation Bar no topo
      appBar: AppBar(
        title: Text('Transferências'),
      ),

      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
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
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{ valor: $valor, numeroConta: $numeroConta }';
  }
}
