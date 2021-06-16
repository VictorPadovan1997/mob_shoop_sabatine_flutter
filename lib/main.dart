import 'package:flutter/material.dart';
import 'package:mob_shop/paginas/splash_screen.dart';
import 'package:mob_shop/repositore/local_data/dao/produto_dao.dart';
import 'package:mob_shop/repositore/local_data/dao/usuario_dao.dart';
import 'package:mob_shop/shared/app_dependecies.dart';
import 'form/login.dart';

void main() {
  runApp(MobApp(
    usuarioDao: UsuarioDao(),
    produtoDao: ProdutoDao(),
  ));
}

class MobApp extends StatelessWidget {
  final UsuarioDao usuarioDao;
  final ProdutoDao produtoDao;
  MobApp({
    @required this.usuarioDao,
    this.produtoDao,
  });
  @override
  Widget build(BuildContext context) {
    return AppDependecies(
      usuarioDao: usuarioDao,
      produtoDao: produtoDao,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
          ),
          primarySwatch: Colors.indigo,
          accentColor: Colors.indigo,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.grey[100],
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.black,
              size: 55,
            ),
          ),
        ),
        home: Splash(),
      ),
    );
  }
}
