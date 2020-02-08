import 'package:bytebank/screen/contact_form/contact_form.dart';
import 'package:bytebank/screen/contacts_list/contacts_list.dart';
import 'package:bytebank/screen/dashboard/dashboard.dart';
import 'package:bytebank/screen/transferencia/formulario.dart';
import 'package:bytebank/screen/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[700],
        accentColor: Colors.deepPurpleAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor:  Colors.deepPurpleAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),


      //Rotas das telas do App
      initialRoute: '/',
      routes: <String,WidgetBuilder> {
        '/': (context) => ContactForm(),
        '/ListTransferencia': (context) => ListaTransferencia(),
        '/FormularioTransferencia': (context) => FormularioTransferencia(),
        '/Dashboard': (context) => Dashboard(),
        '/Contatos': (context) => ContactList(),
        '/ContatosForm': (context) => ContactForm(),
      },


    );
  }
}
