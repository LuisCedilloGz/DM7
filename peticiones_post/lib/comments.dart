import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comentarios"),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
