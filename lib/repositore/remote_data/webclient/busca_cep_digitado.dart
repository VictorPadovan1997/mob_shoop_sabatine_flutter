import 'package:flutter/material.dart';
import 'package:mob_shop/shared/componentes/dialog.dart';
import 'package:mob_shop/shared/componentes/progress.dart';

import '../../../form/usuario_cadastro_endereco.dart';
import '../../../shared/constantes.dart';
import 'cep_web_client.dart';

class BuscaCepDigitado extends StatelessWidget {
  final cep;
  BuscaCepDigitado(this.cep) : super();
  @override
  Widget build(BuildContext context) {
    CepWebClient cepWebClient = CepWebClient();
    return Scaffold(
      body: FutureBuilder(
        future: cepWebClient.buscaEnderecoCep(cep),
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
                  novoUsuario.logradouro = snapshot.data[0];
                  novoUsuario.bairro = snapshot.data[1];
                  return UsuarioCadastroEndereco();
                } else {
                  ResponseDialog();
                }
              }
          }
          return Progress();
        },
      ),
    );
  }
}
