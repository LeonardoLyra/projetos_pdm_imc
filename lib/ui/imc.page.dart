import 'package:flutter/material.dart';

class IMCPage extends StatefulWidget {
  @override
  _IMCPageState createState() => _IMCPageState();
}

class _IMCPageState extends State<IMCPage> {
  final txtPesoCtrl = TextEditingController();

  final txtAlturaCtrl = TextEditingController();

  double imc = 0;
  String image = 'assets/images/ideal.png';
  String mensagem =
      "Preencha os campos e clique em 'Calcular IMC' para obter os resultados!";

  double calculaIMC(double peso, double altura) {
    return peso / (altura * altura);
  }

  String obtemImagemPeloIMC(double imc) {
    if (imc < 17) {
      return this.image = 'assets/images/magreza.png';
    } else if (imc < 18.49) {
      return this.image = 'assets/images/abaixo.png';
    } else if (imc < 24.99) {
      return this.image = 'assets/images/ideal.png';
    } else if (imc < 29.99) {
      return this.image = 'assets/images/sobre.png';
    } else {
      return this.image = 'assets/images/obesidade.png';
    }
  }

  String obtemMensagemPeloIMC(double imc) {
    if (imc < 17) {
      return this.mensagem =
          'Muito abaixo do peso\nSeu IMC é ${imc.toStringAsFixed(2)}';
    } else if (imc < 18.49) {
      return this.mensagem =
          'Abaixo do peso\nSeu IMC é ${imc.toStringAsFixed(2)}';
    } else if (imc < 24.99) {
      return this.mensagem = 'Peso ideal\nSeu IMC é ${imc.toStringAsFixed(2)}';
    } else if (imc < 29.99) {
      return this.mensagem = 'Sobrepeso\nSeu IMC é ${imc.toStringAsFixed(2)}';
    } else {
      return this.mensagem = 'Obesidade\nSeu IMC é ${imc.toStringAsFixed(2)}';
    }
  }

  void onCalculaIMCPressed() {
    double peso = double.parse(txtPesoCtrl.text);
    double altura = double.parse(txtAlturaCtrl.text);

    double imc = calculaIMC(peso, altura);

    obtemImagemPeloIMC(imc);
    obtemMensagemPeloIMC(imc);

    //txtPesoCtrl.text = "";
    //txtAlturaCtrl.text = "";

    setState(() {
      this.imc = imc;
      this.image = image;
    });
  }

//executei o setState(), executa novamente o método build.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Cálculo IMC"),
        centerTitle: true,
        backgroundColor: Colors.black,
        shadowColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Peso",
                      hintText: "Peso em kg",
                    ),
                    keyboardType: TextInputType.number,
                    controller: txtPesoCtrl,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Altura",
                      hintText: "Altura em metros",
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                    controller: txtAlturaCtrl,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.black,
                      child: Text(
                        "Calcular IMC",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: onCalculaIMCPressed,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("$mensagem"),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Image.asset('$image'),
            ),
          ),
        ],
      ),
    );
  }
} //my app
