import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mob_shop/repositore/remote_data/webclient/busca_cep_digitado.dart';
import 'package:mob_shop/shared/constantes.dart';
import '../paginas/inicio.dart';
import '../shared/constantes.dart';
import 'login.dart';

class ContaUsuario extends StatefulWidget {
  ContaUsuario({
    Key key,
  }) : super(key: key);

  @override
  _ContaUsuarioState createState() => _ContaUsuarioState();
}

class _ContaUsuarioState extends State<ContaUsuario> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController cepController = TextEditingController();
    final TextEditingController logradouroController = TextEditingController();
    final TextEditingController bairroController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    String _validarEmail(String value) {
      if (value.trim().isEmpty) {
        return 'Informe o e-mail';
      }
      return null;
    }

    String _validarNome(String value) {
      if (value.trim().isEmpty) {
        return 'Informe o nome';
      }
      return null;
    }

    String _validarCep(String value) {
      if (value.trim().isEmpty) {
        return 'Informe o e-mail';
      }
      return null;
    }

    String _validarSenha(String value) {
      if (value.trim().isEmpty) {
        return 'Informe a senha';
      }
      return null;
    }

    if (novoUsuario.nome != '') {
      nomeController.text = novoUsuario.nome;
    }

    if (novoUsuario.email != '') {
      emailController.text = novoUsuario.email;
    }

    if (novoUsuario.senha != '') {
      senhaController.text = novoUsuario.senha;
    }

    if (novoUsuario.cep != '') {
      cepController.text = novoUsuario.cep;
    }

    if (novoUsuario.logradouro != '') {
      logradouroController.text = novoUsuario.logradouro;
    }

    if (novoUsuario.bairro != '') {
      bairroController.text = novoUsuario.bairro;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: Stack(children: <Widget>[
        Container(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: new Padding(
                      padding: const EdgeInsets.all(2.0),
                    ),
                  ),
                  Center(
                    child: new Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Detalhes da Conta",
                          style: new TextStyle(
                            fontSize: 27.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                          ),
                          new Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: new TextFormField(
                              validator: _validarNome,
                              controller: nomeController,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: 'Nome',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: new TextFormField(
                              validator: _validarEmail,
                              controller: emailController,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: 'E-mail',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: new TextFormField(
                              validator: _validarSenha,
                              obscureText: true,
                              controller: senhaController,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: 'Senha',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: new TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CepInputFormatter(),
                              ],
                              onChanged: (value) {
                                if (value.length == 10) {
                                  String cepFormatado =
                                      value.replaceAll(".", "");
                                  novoUsuario.cep = cepController.text;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BuscaCepDigitado(cepFormatado),
                                    ),
                                  );
                                }
                              },
                              validator: _validarCep,
                              controller: cepController,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: 'CEP',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: new TextFormField(
                              controller: logradouroController,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: 'Logradouro',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: new TextFormField(
                              controller: bairroController,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: 'Bairro',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ButtonTheme(
                              minWidth: 100.0,
                              child: new RaisedButton(
                                color: Colors.deepPurpleAccent.withOpacity(0.5),
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                child: Wrap(
                                  children: [
                                    Text(
                                      "ALTERAR",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    usuarioDao.save(novoUsuario);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Inicio(),
                                      ),
                                    );
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ButtonTheme(
                              minWidth: 100.0,
                              child: new RaisedButton(
                                color: Colors.deepPurpleAccent.withOpacity(0.5),
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                child: Wrap(
                                  children: [
                                    Text(
                                      "EXCLUIR CONTA",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                onPressed: () async {
                                  usuarioDao.deletaUsuario(novoUsuario);
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}
