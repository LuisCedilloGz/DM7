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
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        
        itemCount: _post.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.amber,
            child: InkWell(
              splashColor: Colors.deepPurple,
              onTap: () {
                print("postId ${_post[index].id}");

                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            Comments(post: _post[index])));
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 32.0, bottom: 32.0, right: 20.0, left: 20.0),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      _post[index].title,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _post[index].body,
                      style: TextStyle(color: Colors.blueGrey.shade600),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.red),
        backgroundColor: Colors.white,
        onPressed: () {
          print("length: ${_post.length}");
        },
      ),
    );
  }
}
