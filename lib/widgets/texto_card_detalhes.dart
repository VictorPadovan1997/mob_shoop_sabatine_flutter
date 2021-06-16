import 'package:flutter/material.dart';

class TextoCardDetalhes extends StatelessWidget {
  final String texto;
  final TextStyle estilo;

  TextoCardDetalhes({this.texto, this.estilo});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 8, left: 16, right: 16),
        child: _estilizarTexto(texto));
  }

  _estilizarTexto(texto) {
    if (estilo == null) {
      return Text(texto);
    }
    return Text(texto, style: TextStyle(fontSize: 29));
  }
}
