import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mob_shop/repositore/remote_data/autentica_usuario.dart';
import 'usuario_cadastro_email_and_senha.dart';

class Login extends StatefulWidget {
  Login({
    Key key,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _validarEmail(String value) {
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

  TapGestureRecognizer _cadastrarConta;

  void initState() {
    super.initState();
    _cadastrarConta = TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UsuarioCadastroEmailAndSenha(),
          ),
        );
      };
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Stack(children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 310.0, start: -117.0),
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
                      padding: const EdgeInsets.all(50.0),
                    ),
                  ),
                  Center(
                    child: new Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Bem vindo a MobShop",
                          style: new TextStyle(
                            fontSize: 27.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.all(10.0),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Ainda não tem uma conta? ',
                                    style: new TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                    ),
                                    //recognizer: _click,
                                  ),
                                  TextSpan(
                                    text: 'Cadastre-se',
                                    style: new TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                    recognizer: _cadastrarConta,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.all(16.0),
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
                              obscureText: true,
                              validator: _validarSenha,
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
                                      "ENTRAR",
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
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => AutenticaUsuario(
                                          emailController.text,
                                        ),
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
          ))
        ]));
  }
}
