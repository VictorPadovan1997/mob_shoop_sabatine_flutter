import 'package:flutter/material.dart';
import 'package:mob_shop/repositore/local_data/dao/usuario_dao.dart';
import 'package:mob_shop/shared/componentes/dialog.dart';
import 'package:mob_shop/shared/componentes/progress.dart';

import '../../paginas/inicio.dart';
import '../../shared/constantes.dart';

class AutenticaUsuario extends StatelessWidget {
  final email;
  AutenticaUsuario(this.email) : super();
  @override
  Widget build(BuildContext context) {
    UsuarioDao usuarioDao = UsuarioDao();
    return Scaffold(
      body: FutureBuilder(
        future: usuarioDao.verificaSeUsuarioExiste(email),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (snapshot.data.length > 0) {
                  var usuario = snapshot.data[0];
                  novoUsuario.nome = usuario.nome;
                  novoUsuario.senha = usuario.senha;
                  novoUsuario.logradouro = usuario.logradouro;
                  novoUsuario.id = usuario.id;
                  novoUsuario.email = usuario.email;
                  novoUsuario.cep = usuario.cep;
                  novoUsuario.bairro = usuario.bairro;
                  return Inicio();
                } else {
                  return ResponseDialog(
                      message: 'Dados não encontrado, tente novamente.');
                }
              }
          }
          return Progress();
        },
      ),
    );
  }
}
