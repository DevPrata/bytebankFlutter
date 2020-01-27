import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Transferências';

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
        title: Text(_tituloAppBar),
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
     Navigator.pushNamed(context,'/FormularioTransferencia').
        then((transferenciaRecebida) => _atualiza(transferenciaRecebida, context));
  }

  void _atualiza(transferenciaRecebida, BuildContext context) {
    //Caso use future para fazer alguma requisicao para atualizar, use setState para atualizar algo dinamico pois
    // sem isso somente ira atualizar quando build for executado novamente
    if(transferenciaRecebida != null){
      setState(() {
        widget._listaTransferencias.add(transferenciaRecebida);
        final snackBar = SnackBar(content: Text('$transferenciaRecebida'), duration: Duration(seconds: 3),);
        Scaffold.of(context).showSnackBar(snackBar);
      });
    }
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