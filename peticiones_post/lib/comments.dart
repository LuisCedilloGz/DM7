/*
Activity llamada desde home que muestra el Post seleccionado y sus comentarios correspondientes.
*/

import 'package:flutter/material.dart';
import 'package:peticiones_post/clases.dart';
import 'package:peticiones_post/get_data.dart';

class Comments extends StatefulWidget {
  final Post post; //Objeto Post requerido desde home.

  Comments({@required this.post});

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  Data data =
      new Data(); //objeto data para utilizar sus métodos para obtener los datos remotos.
  List<Comment> _comments =
      List<Comment>(); //Lista de commentarios obtenidos remotamente.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Método que obtiene los datos de Json remoto y almacena los resultados en lista de comentarios.
    //Se utiliza en método initState para obtener los comentarios del Post al ejecutarse.
    data.getComments(widget.post.id).then((value) => setState(() {
          _comments.addAll(value);
        }));
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
          title: Text("Comentarios"),
          backgroundColor: Colors.red[900],
        ),
        body: SingleChildScrollView(
          //SingleChildScrollView para evitar desbordamiento de contenido.
          child: Column(
            children: <Widget>[
              Card(
                //El Post seleccionado en pantalla anterior se mostrará aquí.
                margin: EdgeInsets.all(5),
                color: Colors.black87,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, right: 20.0, left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            widget.post.title,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\n${widget.post.body}",
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
                          //Se muestran los iconos de option del post.
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            optionIcon(
                                Icon(Icons.thumb_up), 24, Colors.red[600]),
                            Text(
                              "0",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            optionIcon(
                                Icon(Icons.comment), 24, Colors.red[600]),
                            Text(
                              "${_comments.length}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            optionIcon(Icon(Icons.share), 24, Colors.red[600]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height - 320,
                    child: ListView.builder(
                      //Los comentarios del post se muestran aquí.
                        itemCount: _comments.length,
                        itemBuilder: (context, index) {
                          return Card(
                            //Cada comentario se muestra en ListTitle dentro de Cards.
                            color: Colors.black54,
                            child: ListTile(
                                title: Text(
                                  //Se obtiene nombre de cada índice de la lista de comentarios.
                                  _comments[index].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                subtitle: Text(
                                  //Se obtiene email y comentario de cada índice de la lista de comentarios.
                                    "${_comments[index].email}\n\n${_comments[index].body}",
                                    style: TextStyle(color: Colors.white60)),
                                isThreeLine: true,
                                trailing: optionIcon(
                                    Icon(Icons.mail), 24, Colors.white),
                                dense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/user.png'),
                                )),
                          );
                        }),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
