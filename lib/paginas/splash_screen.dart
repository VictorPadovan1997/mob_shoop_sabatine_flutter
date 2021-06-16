import 'package:flutter/material.dart';
import 'package:mob_shop/form/login.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 8,
      navigateAfterSeconds: new Login(),
      title: new Text(
        'Aguarde, carregando...',
        style: new TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      image: Image.asset('utilidades/assets/imagens/logo.png'),
      backgroundColor: Color(0xff302b70),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.white,
    );
  }
}
