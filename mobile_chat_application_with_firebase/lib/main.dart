// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this, non_constant_identifier_names, camel_case_types, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class post {
  String body;
  String author;
  int likes = 0;
  bool userLiked = false;

  post(this.body, this.author);
  void likePost() {
    this.userLiked = !this.userLiked;
    if (this.userLiked) {
      this.likes += 1;
    } else {
      this.likes -= 1;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'chat App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//text refresh controll and call back function
class _MyHomePageState extends State<MyHomePage> {
  List<post> posts = [];
  void newPost(String text) {
    this.setState(() {
      posts.add(new post(text, "ferd"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note pad'),
      ),
      body: Column(children: <Widget>[
        Expanded(child: postList(this.posts)),
        Expanded(child: TextInputWidget(this.newPost)),
      ]),
    );
  }
}

//call back function for handling parameters from the change text function
class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  //the text controller for getting and clearing the textfield
  final controller = TextEditingController();

  @override
  //the dispose method,for freeing up storgae used by the widget
  void dispose() {
    super.dispose();
    controller.dispose();
  }

// the click function for accesing the parameter from the text field and sending it to the text widget
  void click() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: this.controller,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.message),
              labelText: "Type A Message",
              suffixIcon: IconButton(
                splashColor: Colors.orangeAccent,
                tooltip: "send message",
                onPressed: this.click,
                icon: Icon(Icons.send),
              )),
        ),
      ],
    );
  }
}

class postList extends StatefulWidget {
  final List<post> listItems;
  postList(this.listItems);

  @override
  State<postList> createState() => _postListState();
}

class _postListState extends State<postList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
