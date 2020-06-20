import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: " contador de pessoas ", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people=0;
  String _infoText="pode entrar";

  void _changePeople(int delta){
    setState(() {
        _people+=delta;

        if (_people<0){
          _infoText="Mundo invertido ?!";
        }else if  (_people<=10){
          _infoText="pode entrar!";
        }else{
          _people=10;
          _infoText="Lotado!";
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/original.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // para coluna defino centro.
          children: <Widget>[
            Text("Pessoas : $_people",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                      onPressed: () {
                        _changePeople(-1);
                      },
                  ),
                ),
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontStyle: FontStyle.italic))
          ],
        )
      ],
    );
  }
}
