import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    //exibiçao da imagem escolhida pelo App
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }

    //Validaçao do ganhador
    //Usuario Ganhador
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabéns!!!! Você ganhou :D";
      });
    }
    //App ganhador
    else if(
        (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ){
      setState(() {
        this._mensagem = "Poxa, não foi dessa vez! Você Perdeu :(";
      });
    }
    //Empate
    else{
      setState(() {
        this._mensagem = "Empate!!!!!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEEAE6),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'JokenPo',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.brown.shade900,
              fontSize: 28),
        ),
        backgroundColor: Color(0xFFFEDBD0),
      ),
      body: Column(
        //organização da exibição
        crossAxisAlignment: CrossAxisAlignment.center, //alinhamento da coluna
        children: <Widget>[

          //mensagem escolha do app
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade900),
            ),
          ),

          //imagem escolha do app padrao
          Image(image: this._imagemApp),

          //mensagem escolha sua opção
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade900),
            ),
          ),

          //imagens para escolha do usuario
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 150),),

             //Definindo a escolha da imagem do usuário pelo toque
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset('imagens/pedra.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset('imagens/papel.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset('imagens/tesoura.png', height: 100),
              ),
              /*
              Image.asset('imagens/pedra.png', height: 100),
              Image.asset('imagens/papel.png', height: 100),
              Image.asset('imagens/tesoura.png', height: 100),
              */
            ],
          )
        ],
      ),
    );
  }
}
