import 'package:flutter/material.dart';
import 'package:peticiones_post/post.dart';

class Comments extends StatefulWidget {
  final Post post;
  final List<Comment> comments;
  Comments({@required this.post, @required this.comments});

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comentarios"),
          backgroundColor: Colors.black87,
        ),
        body: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(5),
              color: Colors.cyan,
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
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.post.body,
                          style: TextStyle(color: Colors.blueGrey.shade600),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width - 40,
                      color: Colors.blue,
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.thumb_up),
                          Text(" 0 "),
                          Icon(Icons.comment),
                          Text(" {} "),
                          Icon(Icons.share)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height -320,
                  
                  child: ListView.builder(
                    itemCount: widget.comments.length,
                    itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(widget.comments[index].name),
                        subtitle: Text("${widget.comments[index].email}\n\n${widget.comments[index].body}"),
                        
                        isThreeLine: true,
                        dense: false,
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/user.png'),
                        )
                      ),
                    );
                  }),
                ),
              ],
            )
          ],
        ));
  }
}
