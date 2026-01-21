import 'package:flutter/material.dart';

class Hmsuggestion extends StatefulWidget {
  Hmsuggestion({Key? key}) : super(key: key);

  @override
  _HmsuggestionState createState() => _HmsuggestionState();
}

class _HmsuggestionState extends State<Hmsuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      color: Colors.blue,
      child: Text("搜索建议",style: TextStyle(fontSize: 20,color: Colors.white),),
    );
  }
}