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
        leading: Icon(Icons.navigate_before,size: 40,),
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 18.0, 40.0, 12.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,

              style: TextStyle(
                fontSize: 24.0
              ),

              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000'
              ),

              keyboardType: TextInputType.number,
            ),

          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 18.0, 40.0, 12.0),
            child: TextField(
              controller: _controladorCampoValor,

              style: TextStyle(
                  fontSize: 24.0
              ),

              decoration: InputDecoration(
                  icon:Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '000.0'
              ),

              keyboardType: TextInputType.number,
            ),

          ),


          RaisedButton(
            onPressed: () {
              final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
              final double valor = double.tryParse(_controladorCampoValor.text);

              if(numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor,numeroConta);
                debugPrint('$transferenciaCriada');

                final snackBar = SnackBar(content: Text('$transferenciaCriada'),duration: Duration(seconds: 5) ,);
                Scaffold.of(context).showSnackBar(snackBar);
              }

            },
            child:Text('Confirmar'),
            padding: const EdgeInsets.fromLTRB(90.0, 18.0, 90, 12.0) ,

          )

        ],
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
        )
    );
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
