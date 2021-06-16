import 'package:flutter/material.dart';
import 'package:mob_shop/modelos/pedido.dart';
import 'package:mob_shop/paginas/inicio.dart';
import 'package:mob_shop/shared/constantes.dart';

// ignore: must_be_immutable
class CompraRealizada extends StatefulWidget {
  final total;
  CompraRealizada(this.total) : super();

  @override
  CompraRealizadaState createState() => CompraRealizadaState();
}

class CompraRealizadaState extends State<CompraRealizada> {
  final TextEditingController observacoesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Icon icone;
    Color cor;
    String texto;
    texto = 'Compra Finalizada com Sucesso';
    icone = Icon(Icons.check_circle);
    cor = Colors.green;

    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        body: LayoutBuilder(
          builder: (context, constaints) => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 20.0),
                    child: Text(
                      texto,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 38.0,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 1.0, 30.0, 20.0),
                    child: IconButton(
                      icon: icone,
                      iconSize: 150,
                      color: cor,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: InkWell(
            onTap: () {
              itensCarrinho.forEach((element) {
                var pedidos = Pedido(
                  element.movel,
                  widget.total.toString(),
                  'Em análise.',
                  'NovoPedido',
                );
                listaDepedido.add(pedidos);
              });

              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (context) => Inicio(),
                    ),
                  )
                  .then((value) => itensCarrinho.clear());
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
              child: Text(
                'CONFIRMAR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.indigo,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
