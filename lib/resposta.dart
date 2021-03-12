import 'package:flutter/material.dart';

class Resposta extends StatelessWidget{

  final String texto;
  final void Function() onSelect;

  Resposta(this.texto, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: onSelect,
        child: Text(texto)
      ),
    );
  }
}