import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peticiones_post/json/json.dart';
import 'package:peticiones_post/comments.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Json> _notes = List<Json>();

  Future<List<Json>> fetchJson() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);

    var notes = List<Json>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);

      for (var noteJson in notesJson) {
        notes.add(Json.fromJson(noteJson));
      }
    }

    return notes;
  }

  @override
  void initState() {
    fetchJson().then((value) => setState(() {
          _notes.addAll(value);
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
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              splashColor: Colors.deepPurple,
              onTap: () {
                print("presionado");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Comments()));
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 32.0, bottom: 32.0, right: 20.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _notes[index].titulo,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _notes[index].texto,
                      style: TextStyle(color: Colors.blueGrey.shade600),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: _notes.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.red),
        backgroundColor: Colors.white,
        onPressed: () {
          print("length: ${_notes.length}");
        },
      ),
    );
  }
}
