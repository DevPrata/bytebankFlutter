import 'package:bytebank/screen/transferencia/formulario.dart';
import 'package:bytebank/screen/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple[700],
        accentColor: Colors.deepPurpleAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor:  Colors.deepPurpleAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),


      //Rotas das telas do App
      initialRoute: '/',
      routes: <String,WidgetBuilder> {
        '/': (context) => ListaTransferencia(),
        '/FormularioTransferencia': (context) => FormularioTransferencia()
      },


    );
  }
}
