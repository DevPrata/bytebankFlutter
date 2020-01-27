import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando transferência';

const _placeHolderCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _placeHolderCampoConta = 'Número da conta';
const _dicaCampoConta =  '0000';

const _textoBotaoConfimar = 'Confirmar';


//StatefulWidget não é recomendado para adição de conteudo dentro do build da tela
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
        title: Text(_tituloAppBar),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Editor(
                controlador: widget._controladorCampoNumeroConta,
                placeholder: _placeHolderCampoConta,
                dica: _dicaCampoConta,
            ),

            Editor(
                controlador: widget._controladorCampoValor,
                placeholder:_placeHolderCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on,
            ),

            RaisedButton(
              onPressed: () => widget._criaTransferencia(context),
              child: Text(_textoBotaoConfimar),
              padding: const EdgeInsets.fromLTRB(90.0, 18.0, 90, 18.0),
            )

          ],

        ),
      ),
    );
  }
}
