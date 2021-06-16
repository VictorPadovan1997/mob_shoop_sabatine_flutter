import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mob_shop/form/form_pagamento.dart';
import 'package:mob_shop/shared/constantes.dart';
import 'package:mob_shop/widgets/appbar.dart';
import 'package:mob_shop/widgets/lista_carrinho.dart';

class Carrinho extends StatefulWidget {
  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  final formatacaoReais = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    int _valorTotal = _calcularTotal();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBarCustomizada(
        titulo: 'Carrinho',
        ehPaginaCarrinho: true,
      ),
      body: _construirTela(),
      bottomNavigationBar: BottomAppBar(
        child: Row(children: [
          Expanded(
            flex: 5,
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () async {},
                child: Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 10.0, 30.0, 10.0),
                  child: Text(
                    'Total\n' + formatacaoReais.format(_valorTotal),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormPagamento(_valorTotal),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                child: Text(
                  'Continuar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
          ),
        ]),
        color: Colors.green,
      ),
    );
  }

  void atualiza() {
    setState(() {});
  }

  int _calcularTotal() {
    if (itensCarrinho.isNotEmpty) {
      return itensCarrinho
          .map((item) => item.movel.preco * item.quantidade)
          .reduce((precoAtual, precoNovo) => precoAtual + precoNovo);
    }

    return 0;
  }

  Widget _construirTela() {
    if (itensCarrinho.isNotEmpty) {
      return ListaCarrinho(
        atualiza: atualiza,
      );
    } else {
      return Container(
        alignment: Alignment.center,
        height: double.infinity,
        child: Text(
          'Nenhum item no carrinho',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
      );
    }
  }
}
