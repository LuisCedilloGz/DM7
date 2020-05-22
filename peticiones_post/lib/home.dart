/*
Activity principal donde se muestran todos los Posts del archivo remoto.
*/

import 'package:flutter/material.dart';
import 'package:peticiones_post/clases.dart';
import 'package:peticiones_post/comments.dart';
import 'package:peticiones_post/get_data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Data data = new Data(); //objeto data para utilizar sus métodos para obtener los datos remotos.
  List<Post> _post = List<Post>(); //Lista de posts obtenidos remotamente.

  @override
  void initState() {
    //Método que obtiene los datos de Json remoto y almacena los resultados en lista de posts.
    //Se utiliza en método initState para obtener todos los Post al ejecutarse.
    data.getPost().then((value) => setState(() {
          _post.addAll(value);
        }));
    super.initState();
  }

  //Plantilla de Widget para crear los IconButton de pie de Post.
  Widget optionIcon(Icon icon, double size, Color color) {
    return IconButton(
      color: color,
      iconSize: size,
      splashColor: Colors.red,
      icon: icon,
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            splashColor: Colors.black,
            icon: Icon(Icons.view_headline),
            onPressed: () {},
          ),
          title: Text("Posts"),
          backgroundColor: Colors.red[900]),
      body: ListView.builder(
        //Todos los post se enlistarán aquí.
        itemCount: _post.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(5),
            color: Colors.black87,
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, right: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        //Se obtiene titulo de Post de cada índice de la lista de Posts.
                        _post[index].title,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        //Se obtiene contenido de cada índice de la lista de Posts.
                        "\n${_post[index].body}",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width - 40,
                    child: Row(
                      //Se muestran los iconos de option cada post.
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        optionIcon(Icon(Icons.thumb_up), 24, Colors.red[600]),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        IconButton(
                          color: Colors.red[600],
                          iconSize: 24,
                          splashColor: Colors.blue,
                          icon: Icon(Icons.comment),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Comments(
                                      post: _post[index],
                                    )));
                          },
                        ),
                        Text("5",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        optionIcon(Icon(Icons.share), 24, Colors.red[600]),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
