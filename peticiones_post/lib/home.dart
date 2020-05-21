import 'package:flutter/material.dart';
import 'package:peticiones_post/post.dart';
import 'package:peticiones_post/comments.dart';
import 'package:peticiones_post/get_data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Data data = new Data();
  List<Post> _post = List<Post>();

  @override
  void initState() {
    data.getPost().then((value) => setState(() {
          _post.addAll(value);
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.view_headline),
          onPressed: () {},
        ),
        title: Text("Posts"),
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
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
                        _post[index].title,
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("\n${_post[index].body}",
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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),
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
                        Text("5", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20)),
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
