import 'package:bytebank/components/editor.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Novo contato';

const _placeHolderCampoNomeCompleto = 'Nome completo';
const _placeHolderCampoNumero = 'Número da conta';

class ContactForm extends StatelessWidget {

  final TextEditingController _controladorNomeCompleto = TextEditingController();
  final TextEditingController _controladorNumeroConta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorNomeCompleto,
              placeholder: _placeHolderCampoNomeCompleto,
              padding: const EdgeInsets.only(top: 8.0),
              tipoTeclado: TextInputType.text,
            ),
            Editor(
              controlador: _controladorNumeroConta,
              placeholder: _placeHolderCampoNumero,
              padding: const EdgeInsets.only(top: 8.0),
              tipoTeclado: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  child: Text('Criar', style: TextStyle(fontSize: 19.0),),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
