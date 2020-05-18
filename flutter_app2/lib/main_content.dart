import 'package:flutter/material.dart';

class MainContent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: FlutterLogo(),
        title: Text("Flutter App"),
      ),
      body: Center(
        child:Container(
            height: 500,
            width: 300,
            child: Center(
              child:Text(
                "Travel App",
                style: TextStyle(
                    fontFamily: 'Signatra',
                    fontSize: 60.0,
                    color: Colors.white
                ),
              ),
            ),
            //child: Image.asset('assets/img/cover.jpg') imagenes locales
            //child: Image.network('https://imagen.com/image.jpg') imagenes locales
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              //color: Colors.purple.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              image: DecorationImage(
                image: AssetImage('assets/img/cover.jpg'),
                fit: BoxFit.cover
              )
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }

}

/*
Stack(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            /*child: Text(
              "Enjoy it!!",
              style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.amber
              ),
            ),*/
          ),
          Container(
            width: 180,
            height: 180,
            color: Colors.red,
            /*child: Text(
              "Enjoy it!!",
              style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.amber
              ),
            ),*/
          ),
          Container(
            width: 160,
            height: 160,
            color: Colors.green,
            /*child: Text(
              "Enjoy it!!",
              style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.amber
              ),
            ),*/
          ),
        ],
      )
* */