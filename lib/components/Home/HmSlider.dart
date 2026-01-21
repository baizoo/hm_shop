import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class Hmslider extends StatefulWidget {
  final List<BannerItem> banners;

  Hmslider({Key? key,required this.banners}) : super(key: key);

  @override
  _HmsliderState createState() => _HmsliderState();
}

class _HmsliderState extends State<Hmslider> {
  Widget _getSlider(){
    //flutter中获取屏幕宽度的方法
    final double screenWidth = MediaQuery.of(context).size.width; // 屏幕宽度

    return CarouselSlider(items: List.generate(widget.banners.length, (int index){
      return Image.network(widget.banners[index].imgUrl!,fit: BoxFit.cover,width: screenWidth,);
    }), options: CarouselOptions(viewportFraction: 1,autoPlay: true,height: screenWidth*0.5));
  }
  @override
  Widget build(BuildContext context) {
    //stack -> 轮播图 搜索框 指示灯导航
    return Stack(
      children: [_getSlider()],
    );
    // return Container(
    //   color: Colors.blue,
    //   height: 300,
    //   alignment: Alignment.center,
    //    child: Text("轮播图",style: TextStyle(fontSize: 20,color: Colors.white),),
    // );
  }
}