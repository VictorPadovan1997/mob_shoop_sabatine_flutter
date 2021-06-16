import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:mob_shop/repositore/local_data/dao/usuario_dao.dart';
import 'package:mob_shop/repositore/remote_data/webclient/busca_cep_digitado.dart';
import 'package:mob_shop/shared/constantes.dart';
import '../paginas/inicio.dart';
import '../shared/constantes.dart';

class UsuarioCadastroEndereco extends StatefulWidget {
  UsuarioCadastroEndereco() : super();

  @override
  _UsuarioCadastroEnderecoState createState() =>
      _UsuarioCadastroEnderecoState();
}

class _UsuarioCadastroEnderecoState extends State<UsuarioCadastroEndereco> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController cepController = TextEditingController();
    final TextEditingController logradouroController = TextEditingController();
    final TextEditingController bairroController = TextEditingController();
    UsuarioDao usuarioDao = UsuarioDao();

    final _formKey = GlobalKey<FormState>();

    String _validarCep(String value) {
      if (value.trim().isEmpty) {
        return 'Informe o e-mail';
      }
      return null;
    }

    if (novoUsuario.bairro != '') {
      bairroController.text = novoUsuario.bairro;
    }

    if (novoUsuario.logradouro != '') {
      logradouroController.text = novoUsuario.logradouro;
    }

    if (novoUsuario.cep != '') {
      cepController.text = novoUsuario.cep;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: Stack(children: <Widget>[
        Pinned.fromPins(
          Pin(start: 0.0, end: 0.0),
          Pin(size: 250.0, start: -117.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: const Color(0xff6200ee),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
          ),
        ),
        Container(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: new Padding(
                      padding: const EdgeInsets.all(20.0),
                    ),
                  ),
                  Center(
                    child: new Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Informe seu Endereço",
                          style: new TextStyle(
                            fontSize: 27.0,
                            color: Colors.white,
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
                                      "CADASTRAR",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    novoUsuario.cep = cepController.text;
                                    novoUsuario.logradouro =
                                        logradouroController.text;
                                    novoUsuario.bairro = bairroController.text;
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
