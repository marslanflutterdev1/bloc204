import 'package:bloc204/ui/post_ui/post_add_screen.dart';
import 'package:flutter/material.dart';

class PostDisplay extends StatefulWidget {
  const PostDisplay({super.key});

  @override
  State<PostDisplay> createState() => _PostDisplayState();
}

class _PostDisplayState extends State<PostDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Post Display"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body:const SafeArea(
        child: Center(
          child: Text("Post Display"),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (e)=>const PostAddScreen()));},child:const Text("ADD"),),
    );
  }
}
