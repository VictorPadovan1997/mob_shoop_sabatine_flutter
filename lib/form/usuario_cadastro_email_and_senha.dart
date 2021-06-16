import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mob_shop/form/usuario_cadastro_endereco.dart';
import 'package:mob_shop/shared/constantes.dart';

class UsuarioCadastroEmailAndSenha extends StatefulWidget {
  UsuarioCadastroEmailAndSenha({
    Key key,
  }) : super(key: key);

  @override
  _UsuarioCadastroEmailAndSenhaState createState() =>
      _UsuarioCadastroEmailAndSenhaState();
}

class _UsuarioCadastroEmailAndSenhaState
    extends State<UsuarioCadastroEmailAndSenha> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();
    final TextEditingController nomeController = TextEditingController();

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

    String _validarSenha(String value) {
      if (value.trim().isEmpty) {
        return 'Informe a senha';
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(
            Icons.arrow_back,
          ),
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
                      child: Text("Informe Seus Dados",
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
                            child: ButtonTheme(
                              minWidth: 100.0,
                              child: new RaisedButton(
                                color: Colors.deepPurpleAccent.withOpacity(0.5),
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                child: Wrap(
                                  children: [
                                    Text(
                                      "PRÓXIMO",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    novoUsuario.email = emailController.text;
                                    novoUsuario.senha = senhaController.text;
                                    novoUsuario.nome = nomeController.text;
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UsuarioCadastroEndereco(),
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
