import 'package:flutter/material.dart';

class Hmmorelist extends StatefulWidget {
  Hmmorelist({Key? key}) : super(key: key);

  @override
  _HmmorelistState createState() => _HmmorelistState();
}

class _HmmorelistState extends State<Hmmorelist> {
  @override
  Widget build(BuildContext context) {
    //网格是两列
    return SliverGrid.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,), itemBuilder: (buildcontext,index){
      
      return Container(
        alignment: Alignment.center,
        width: 80,
        height: 100,
        color: Colors.blue,
        // margin: EdgeInsets.only(left: 10),
        child: Text("更多列表$index",style: TextStyle(fontSize: 20,color: Colors.white),),
      );
    });
  }
}