import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      //MaterialApp é um metodo construtor
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// usando o _ na variavel people para que ela não possa
// ser acessadafora desta classe
  int _people = 0;
  String _infoText = "Pode Entrar!";

// função criada para atualizar tela quando tocar nos  botões +1 e -1
  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if (_people < 0) {
        _infoText = "Ops! Número abaixo de zero!";
      } else if (_people <= 10) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Alinhar widget no centro da tela
          //Criando  widget com 01 coluna e 03 linhas
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            //Criar botão
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  //formatar o botão adicionando uma área torno do texto
                  padding: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      onPressed: () {
                        _changePeople(1);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      onPressed: () {
                        _changePeople(-1);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
