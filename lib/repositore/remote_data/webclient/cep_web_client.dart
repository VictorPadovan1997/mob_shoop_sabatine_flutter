import 'dart:convert';
import 'package:http/http.dart';
import 'package:mob_shop/repositore/remote_data/webclient/webclient.dart';

class CepWebClient {
  List endereco = [];
  buscaEnderecoCep(cep) async {
    final Response response = await client
        .get(Uri.parse('https://viacep.com.br/ws/' + cep + '/json/'));

    if (response.statusCode == 200) {
      final resultadoRequisicao = jsonDecode(response.body);

      if (resultadoRequisicao['erro'] == true) {
        endereco.clear();
      } else {
        endereco.clear();
        endereco.add(resultadoRequisicao['logradouro']);
        endereco.add(resultadoRequisicao['bairro']);
      }

      return endereco;
    }

    endereco.clear();
    return endereco;
  }
}
