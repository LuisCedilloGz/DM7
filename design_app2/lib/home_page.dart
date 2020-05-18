import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text("Flutter Design Example",
            style: TextStyle(fontFamily: 'Signatra', fontSize: 40)),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/cover.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          Center(
              child: Container(
                height: 100,
                color: Colors.black.withOpacity(0.5),
             )
          ),
          Center(
            child: Text(
              "Practica 1",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  fontFamily: 'Signatra'
              ),
            )
          )
        ],
      ),
    );
  }
}
