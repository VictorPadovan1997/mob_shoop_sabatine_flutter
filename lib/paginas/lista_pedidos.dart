import 'package:flutter/material.dart';
import 'package:mob_shop/modelos/pedido.dart';
import 'package:mob_shop/shared/componentes/center_mensagem.dart';
import 'package:mob_shop/shared/constantes.dart';
import 'package:mob_shop/shared/pedido_item.dart';

class ListaPedidos extends StatefulWidget {
  ListaPedidos() : super();

  @override
  ListaPedidosState createState() => ListaPedidosState();
}

class ListaPedidosState extends State<ListaPedidos> {
  List<Pedido> nome = [];
  List<Pedido> filterNome = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      nome = listaDepedido;
      filterNome = nome;
    });
  }

  @override
  Widget build(BuildContext context) {
    var title = 'Pedidos';
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: Column(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 55,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: bodyList(),
      ),
    );
  }

  Widget bodyList() {
    return Column(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.all(8.0),
          child: campoTexto(),
        ),
        new Expanded(
          child: listaDinamica(),
        ),
      ],
    );
  }

  Widget listaDinamica() {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount:
          filterNome.length == 0 ? filterNome.length + 1 : filterNome.length,
      itemBuilder: (BuildContext context, int index) {
        if (filterNome.length > 0) {
          return PedidoItem(
            filterNome[index],
            onClick: () {},
          );
        } else {
          return CenteredMessage(
            'Nenhum registro encontrado',
            icon: Icons.warning,
          );
        }
      },
    );
  }

  Widget campoTexto() {
    return new TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }
}
