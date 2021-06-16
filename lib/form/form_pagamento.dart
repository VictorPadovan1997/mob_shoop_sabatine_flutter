import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:mob_shop/paginas/compra_realizada.dart';

class FormPagamento extends StatefulWidget {
  final total;
  FormPagamento(this.total) : super();

  @override
  FormPagamentoState createState() => FormPagamentoState();
}

class FormPagamentoState extends State<FormPagamento> {
  String cardNumber = '';
  String cardHolderName = 'SEU NOME';
  String cvvNumber = '';
  String expiryDate = '';
  bool showBackView = false;
  final _formKey = GlobalKey<FormState>();

  void onCreditCardModel(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      cardHolderName = creditCardModel.cardHolderName;
      expiryDate = creditCardModel.expiryDate;
      cvvNumber = creditCardModel.cvvCode;
      showBackView = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pagamento',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CreditCardWidget(
              labelCardHolder: 'SEU NOME',
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              height: 210,
              cardHolderName: cardHolderName,
              cvvCode: cvvNumber,
              showBackView: showBackView,
              cardBgColor: Colors.indigo[900],
              textStyle: TextStyle(
                color: Colors.indigo[100],
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              animationDuration: Duration(milliseconds: 1200),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                  formKey: _formKey,
                  onCreditCardModelChange: onCreditCardModel,
                  cursorColor: Colors.red,
                  themeColor: Colors.black,
                  obscureCvv: true,
                  obscureNumber: true,
                  cardNumberDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Numero Cartão',
                    hintText: 'XXXX XXXX XXXX XXXX',
                  ),
                  expiryDateDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Data Expiração',
                    hintText: 'XX/XX',
                  ),
                  cvvCodeDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CVV',
                    hintText: 'XXX',
                  ),
                  cardHolderDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome Completo',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: () async {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CompraRealizada(widget.total),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            child: Text(
              'Continuar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.purple[700],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
