import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sobre"),
        ),
        body: _body());
  }
}

_body() {
  return Container(
    child: Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo_sem_fundo.png'),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Text(
                "A Igreja Batista da Fé de Sousa teve seu início na " +
                    "década de 70. Nesse tempo Deus usou pessoas específicas e direcionou" +
                    " o que no ínicio era um simples trabalho evangelístico para se tornar " +
                    "a primeira igreja do movimento Batista Regular no Estado da Paraíba. " +
                    "São quase 43 anos de perseverança em pregar o Evangelho de Jesus Cristo.",
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 2),
              child: Text(
                "Somos uma Família(A FAMÍLIA DA FÉ). Nosso propósito é servir a Deus e uns aos outros, fazendo discípulos de Jesus Cristo em todas as nações até que Ele venha buscar a sua Igreja!",
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Text(
                "📍Estamos situados na Rua José Francisco Vieira de Fiqueiredo. N° 119 - Bairro Areias. Sousa/Paraíba.",
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon:
                  Image.asset('assets/google-maps.png', width: 40, height: 40),
              iconSize: 34,
              onPressed: () {
                String url = 'https://goo.gl/maps/JVMh3oEXGTDKhDLg6';
                _launchURL(url);
              },
            ),
            TextButton(
              onPressed: () {
                _launchURL("https://goo.gl/maps/JVMh3oEXGTDKhDLg6");
              },
              child: Text("Localização"),
            ),
          ],
        ),
      ],
    ),
  );
}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    // throw 'Could not launch $url';
    print('deu erro com a url ' + url);
  }
}
