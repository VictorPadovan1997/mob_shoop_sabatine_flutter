import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:mob_shop/form/conta_usuario.dart';
import 'package:mob_shop/repositore/local_data/busca_favoritos.dart';

import '../modelos/item_carrinho.dart';
import '../widgets/appbar.dart';
import '../widgets/grid_produtos.dart';
import 'lista_pedidos.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final List moveis = [
    {
      "titulo": "Mesa",
      "preco": 300,
      "foto": "movel1.jpeg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Cadeira",
      "preco": 120,
      "foto": "movel2.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Manta",
      "preco": 200,
      "foto": "movel3.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Sofá Cinza",
      "preco": 800,
      "foto": "movel4.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Jogo de Cama",
      "preco": 250,
      "foto": "movel6.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Sofá Branco",
      "preco": 900,
      "foto": "movel7.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBarCustomizada(titulo: '', ehPaginaCarrinho: false),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          if (value == 0) {
            return Inicio();
          }

          if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaPedidos(),
              ),
            );
          }

          if (value == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuscaFavoritos(),
              ),
            );
          }

          if (value == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContaUsuario(),
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Inicio'),
            icon: Icon(Icons.list_sharp),
          ),
          BottomNavigationBarItem(
            title: Text('Pedidos'),
            icon: Icon(
              Icons.check_box,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('Favoritos'),
            icon: Icon(
              Icons.star,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('Conta'),
            icon: Icon(
              Icons.verified_user,
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 250.0, start: -117.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xff6200ee),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 30, right: 20, top: 10, bottom: 10),
                      child: Divider(color: Colors.white),
                    ),
                  ),
                  Text(
                    'Categorias',
                    style: TextStyle(color: Colors.white, fontSize: 27),
                  ),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 20, right: 30, top: 10, bottom: 10),
                          child: Divider(color: Colors.white)))
                ],
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Flexible(
                child: GridProdutos(
                  atualiza: atualiza,
                  moveis: moveis,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void atualiza() {
    setState(() {});
  }
}
