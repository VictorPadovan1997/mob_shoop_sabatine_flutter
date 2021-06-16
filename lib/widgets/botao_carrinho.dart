import 'package:flutter/material.dart';
import 'package:mob_shop/paginas/carrinho.dart';
import 'package:mob_shop/paginas/inicio.dart';
import 'package:mob_shop/shared/constantes.dart';
import 'package:mob_shop/widgets/indicador_botao_carrinho.dart';

class BotaoCarrinho extends StatefulWidget {
  @override
  _BotaoCarrinhoState createState() => _BotaoCarrinhoState();
}

class _BotaoCarrinhoState extends State<BotaoCarrinho> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Carrinho(),
          ),
        ).then((value) => setState(() {}));
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: 30, left: 20),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            topLeft: Radius.circular(100),
          ),
        ),
        child: _visibilidadeIndicadorCarrinho(),
      ),
    );
  }

  Widget _visibilidadeIndicadorCarrinho() {
    if (itensCarrinho.length > 0) {
      return Stack(children: [
        Image(
            height: 30,
            image: AssetImage('utilidades/assets/icones/carrinho.png')),
        IndicadorBotaoCarrinho()
      ]);
    }
    return Image(
        height: 30, image: AssetImage('utilidades/assets/icones/carrinho.png'));
  }
}
