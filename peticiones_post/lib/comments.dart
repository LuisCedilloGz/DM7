import 'package:flutter/material.dart';
import 'package:peticiones_post/post.dart';
import 'package:peticiones_post/get_data.dart';

class Comments extends StatefulWidget {
  final Post post;
  Comments({@required this.post});

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  Data data = new Data();
  List<Comment> _comments = List<Comment>();

  @override
  void initState() {
    data.getComments(widget.post.id).then((value) => setState(() {
          _comments.addAll(value);
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comentarios"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Container(
          child: Card(
            color: Colors.cyan,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 32.0, bottom: 32.0, right: 20.0, left: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                
                children: <Widget>[
                  Text(
                    widget.post.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.post.body,
                    style: TextStyle(color: Colors.blueGrey.shade600),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
