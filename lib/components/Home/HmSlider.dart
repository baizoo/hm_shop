import 'package:flutter/material.dart';

class Hmslider extends StatefulWidget {
  Hmslider({Key? key}) : super(key: key);

  @override
  _HmsliderState createState() => _HmsliderState();
}

class _HmsliderState extends State<Hmslider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 300,
      alignment: Alignment.center,
       child: Text("轮播图",style: TextStyle(fontSize: 20,color: Colors.white),),
    );
  }
}