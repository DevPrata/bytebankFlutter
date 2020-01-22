# bytebank

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

O que são Widgets?
São os componentes do flutter, ele representa cada elemento visual da tela no Flutter, ao construir uma tela podemos usar 1 ou N Widgets.


## Níveis de widget
	App — RUNAPP()
		└── Column
			  ├── Text
			  ├── Text
			  ├── Text
			  └── Column
				    └── Text


A partir da column pode se considerar que iria ser um arvore de widget onde um widget ira conter multiplos widgets dentro dela


## Exemplo de uma arvore de widgets
```
import 'package:flutter/material.dart';

void main() => runApp(Column(
      children: <Widget>[
        Text('Deliver features faster', textDirection: TextDirection.ltr),
        Text('Craft beautiful UIs', textDirection: TextDirection.ltr),
        Text('Craft beautiful UIs', textDirection: TextDirection.ltr),
        Column(
          children: <Widget>[
            Text('Craft beautiful UIs', textDirection: TextDirection.ltr),
          ],
        )
      ],
    )
);
```

Como vimos, diferente de outras plataformas, o Flutter cria o layout via código fonte, ou seja, sem a necessidade de um arquivo separado para o layout, como por exemplo, HTML ou XML também conhecido como modo imperativo.
Esse tipo de abordagem é conhecida como estilo de reação (react-style) ou declativa (declarative).

## Material design 

Acessaremos a página Material Components, que é bem similar à Basic Widgets e mostra todas as possibilidades dessa opção. Um detalhe é que, para conseguirmos implementar todos os comportamentos que desejamos, precisaremos de uma estrutura mínima, que é a utilização do MaterialApp como base da nossa aplicação. Esse widget envolverá todos os outros componentes que adicionarmos, e é responsável pelos comportamentos esperados por padrão nessa implementação, seja na parte de navegação, transição e assim por diante. Sendo assim, envolveremos basicamente todo o nosso código com o MaterialApp.

## Diferença entre StatefulWidget e StatelessWidget
StatefulWidget você podera modificar esses widgets de forma dinamica 

StatelessWidget não consegue modificar esse conteudo

Durante a extração de código, vimos as referências StatelessWidget e StatefulWidget, implementações da classe abstrata Widget, que permitem encapsular outros Widget dentro de classes que dão mais significado dentro do nosso App.

##Boas práticas
1. Para a impressão considere o debugPrint() como boa prática.
2. Considere o uso do tryParse() para realizar a conversão.


## Textfield 
Para criação de um textfield para um formulario você ira ter widget chamado Textfield(), nele ira ter props:
 
style(que tem widget TextStyle para estilizar o texto do input);
 
decoration:(Que tem widget chamado InputDecoration(onde ira ter placeholder,hintText do input));

keyboardType: Onde você ira dizer que tipo de teclado mostrar quando estiver naquele campo;

controller: onde iria controlar toda parte que usuario digitar

####Exemplo de textfield:

      final TextEditingController _controladorCampoNumeroConta = TextEditingController(); // Declarar a variavel na classe do seu Widget 
       
      
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
      
 
## Botão