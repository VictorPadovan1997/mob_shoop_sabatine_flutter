import 'package:flutter/material.dart';
import 'package:mob_shop/modelos/movel.dart';
import 'package:mob_shop/widgets/appbar.dart';
import 'package:mob_shop/widgets/card_detalhes.dart';

class Detalhes extends StatefulWidget {
  final Movel movel;

  Detalhes(this.movel);

  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage('utilidades/assets/imagens/${widget.movel.foto}'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarCustomizada(
          titulo: '',
          ehPaginaCarrinho: false,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 205,
            margin: EdgeInsets.all(16),
            child: CardDetalhes(
              movel: widget.movel,
              atualizaPagina: atualiza,
            ),
          ),
        ),
      ),
    );
  }

  void atualiza() {
    setState(() {});
  }
}
