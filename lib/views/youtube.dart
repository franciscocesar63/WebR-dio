import 'package:flutter/material.dart';

class Youtube extends StatelessWidget {
  const Youtube({Key key}) : super(key: key);

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
    child: Text("Tela Sobre"),
  );
}
