import 'package:flutter/material.dart';

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String placeholder;
  final String dica;
  final IconData icone;
  final EdgeInsets padding;
  final TextInputType tipoTeclado;
  //TODO: Refazer logica do tipo de teclado para pegar como defeault texto, rever a tela de formulario em transferencia

  Editor({
    this.controlador,
    this.placeholder,
    this.dica,
    this.icone,
    this.padding,
    this.tipoTeclado
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding != null ? padding : const EdgeInsets.fromLTRB(40.0, 18.0, 40.0, 12.0),

      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        keyboardType: tipoTeclado != null ? tipoTeclado : TextInputType.number,
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: placeholder,
            hintText: dica != null ? dica : null
        ),
      ),

    );
  }
}
