import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor:  Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary
        )
      ),


      //Criando as rotas das telas
      initialRoute: '/',
      routes: {
        '/': (context) => ListaTransferencia(),
        '/FormularioTransferencia': (context) => FormularioTransferencia()
      },

      /*
      //Home: Permite indicar qualquer widget como primeira tela. no root do MaterialApp
      home: Scaffold(
        // Scaffold: Permitirá implementarmos toda a estrutura básica (ou esqueleto) do Material Design.

        //Corpo do aplicativo
        body: ListaTransferencia(),
      ),*/


    );
  }
}

//TODO: Implementar roteamento das telas utilizando um ENUM
class Routes {
  final _value;
  const Routes._internal(this._value);
  toString() => 'Enum.$_value';

  static const LISTA_TRANSFERENCIA  = const Routes._internal('/');
  static const FORMULARIO_TRANSFERENCIA = const Routes._internal('/FormularioTransferencia');
}


class FormularioTransferencia extends StatefulWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return StateFormularioTransferencia();
  }

  //Context é necessario para ultilizar o SnackBar
  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);

      Navigator.pop(context,transferenciaCriada);
    }
  }

}

class StateFormularioTransferencia extends State<FormularioTransferencia>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Criando transferência'),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Editor(
                controlador: widget._controladorCampoNumeroConta,
                placeholder: 'Número da conta',
                dica: '0000'
            ),

            Editor(
                controlador: widget._controladorCampoValor,
                placeholder: 'Valor',
                dica: '0.00',
                icone: Icons.monetization_on
            ),

            RaisedButton(
              onPressed: () => widget._criaTransferencia(context),
              child: Text('Confirmar'),
              padding: const EdgeInsets.fromLTRB(90.0, 18.0, 90, 18.0),
            )

          ],

        ),
      ),
    );
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

//StatefulWidget não é recomendado para adição de conteudo dentro do build da tela
class ListaTransferencia extends StatefulWidget {

  //Caso seja algo que não vai mudar
  final List<Transferencia> _listaTransferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }

}

class ListaTransferenciasState extends State<ListaTransferencia> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Navigation Bar no topo
      appBar: AppBar(
        title: Text('Transferências'),
      ),

      //ListView é utilizado para quem precise de uma lista com quantidade enorme de items, algo que column não consegue proporcionar
      //E caso precise de um ListView em dinamico que possa mudar a qualquer momento use a função buillder no exemplo abaixo:
      body: ListView.builder(
        itemCount: widget._listaTransferencias.length,
        itemBuilder: (context,indice){
          final transferencia = widget._listaTransferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),

      floatingActionButton: Builder(
        builder: (ctx) => FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=> _goToFormularioTransferencia(ctx),
        ),
      ),
    );
  }

  void _goToFormularioTransferencia(BuildContext context) {
    //Navegação de tela Inicial para formulario, nele ira precisar do contexto da aplicação, e estou utilizando MaterialPageRoute para facilitar uso
    //MaterialPageRoute ira precisar de builder nele o contexto e ira retornar a tela que você navegar
    final Future future = Navigator.pushNamed(context,'/FormularioTransferencia');

    //Função assicrona onde tela futura voltar para tela inicial
    // e verificar se houve um valor retornado e assim receber esse valor para tela inicial
    future.then((transferenciaRecebida){
      //Caso use future para fazer alguma requisicao para atualizar, use setState para atualizar algo dinamico pois
      // sem isso somente ira atualizar quando build for executado novamente
      Future.delayed(Duration(seconds: 1), (){
        if(transferenciaRecebida != null){
          setState(() {
            widget._listaTransferencias.add(transferenciaRecebida);
            final snackBar = SnackBar(content: Text('$transferenciaRecebida'), duration: Duration(seconds: 3),);
            Scaffold.of(context).showSnackBar(snackBar);
          });
        }
      });

    });
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
