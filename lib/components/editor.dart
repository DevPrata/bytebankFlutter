import 'package:flutter/material.dart';

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String placeholder;
  final String dica;
  final IconData icone;

  Editor({
    this.controlador,
    this.placeholder,
    this.dica,
    this.icone
  });

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
