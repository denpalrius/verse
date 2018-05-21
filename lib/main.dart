import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './models/verse-of-the-day.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Day Verse',
      theme: new ThemeData(
          primarySwatch: Colors.lightBlue, accentColor: Colors.orange[800]),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String uri =
      'https://www.biblegateway.com/votd/get/?format=json&version=NIV';

  Future<Verse> fetchVerse() async {
    try {
      var res = await http
          .get(Uri.encodeFull(uri), headers: {'Accept': 'application/json'});
      var body = json.decode(res.body);
      return new Verse.fromJson(body['votd']);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text("Verse of the day",
      //       style: new TextStyle(color: Colors.white)),
      // ),
      body: new Center(
          child: new FutureBuilder<Verse>(
        future: fetchVerse(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new Text(snapshot.data.text);
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          }
          // By default, show a loading spinner
          return new CircularProgressIndicator();
        },
      )),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => share('check out this verse'),
        tooltip: 'Share',
        child: new Icon(Icons.share),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //this.getVerse();
  }
}
