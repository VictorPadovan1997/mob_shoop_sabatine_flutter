import 'package:mob_shop/modelos/item_carrinho.dart';
import 'package:mob_shop/modelos/movel.dart';

class Pedido {
  Movel movel;
  String valor;
  String status;
  String situacao;

  Pedido(
    this.movel,
    this.valor,
    this.status,
    this.situacao,
  );
}
