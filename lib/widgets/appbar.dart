import 'package:flutter/material.dart';
import 'package:mob_shop/form/login.dart';
import 'package:mob_shop/widgets/botao_carrinho.dart';

class AppBarCustomizada extends StatelessWidget with PreferredSizeWidget {
  final String titulo;
  final bool ehPaginaCarrinho;

  AppBarCustomizada({this.titulo, this.ehPaginaCarrinho});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titulo, style: TextStyle(color: Colors.black)),
      titleSpacing: 0.0,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.indigo),
      leading: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: IconButton(
          icon: Icon(
            Icons.exit_to_app_sharp,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () async {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => Login(),
              ),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      actions: [
        _mudarPaginaCarrinho(ehPaginaCarrinho),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  Widget _mudarPaginaCarrinho(bool ehPaginaCarrinho) {
    if (ehPaginaCarrinho) return Container();
    return BotaoCarrinho();
  }
}
