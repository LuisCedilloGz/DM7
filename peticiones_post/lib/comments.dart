import 'package:flutter/material.dart';
import 'package:peticiones_post/post.dart';
import 'package:peticiones_post/get_data.dart';

class Comments extends StatefulWidget {
  final Post post;
  //final List<Comment> comments;
  Comments({@required this.post}); //@required this.comments});

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  Data data = new Data();
  List<Comment> _comments = List<Comment>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data.getComments(widget.post.id).then((value) => setState(() {
          _comments.addAll(value);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comentarios"),
          backgroundColor: Colors.black87,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
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
                                color: Colors.white,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              color: Colors.red[600],
                              iconSize: 24,
                              splashColor: Colors.blue,
                              icon: Icon(Icons.thumb_up),
                              onPressed: () {},
                            ),
                            Text(
                              "0",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            IconButton(
                              color: Colors.red[600],
                              iconSize: 24,
                              splashColor: Colors.blue,
                              icon: Icon(Icons.comment),
                              onPressed: () {},
                            ),
                            Text(
                              "${_comments.length}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            IconButton(
                              color: Colors.red[600],
                              iconSize: 24,
                              splashColor: Colors.blue,
                              icon: Icon(Icons.share),
                              onPressed: () {},
                            ),
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
                        itemCount: _comments.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.black54,
                            child: ListTile(
                                title: Text(
                                  _comments[index].name,
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                    "${_comments[index].email}\n\n${_comments[index].body}",
                                    style: TextStyle(color: Colors.white60)),
                                isThreeLine: true,
                                dense: false,
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
