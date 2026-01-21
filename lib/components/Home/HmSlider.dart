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
  CarouselSliderController _controller = CarouselSliderController();//控制轮播图跳转的控制器
  int _currentIndex = 0;//当前轮播图的索引

  Widget _getSlider(){
    //flutter中获取屏幕宽度的方法
    final double screenWidth = MediaQuery.of(context).size.width; // 屏幕宽度

    return CarouselSlider(
      carouselController: _controller,
      items: List.generate(widget.banners.length, (int index){
      return Image.network(widget.banners[index].imgUrl!,fit: BoxFit.cover,width: screenWidth,);
    }), options: CarouselOptions(
      viewportFraction: 1,
      autoPlay: true,
      // autoPlay: false,
      height: screenWidth*0.5,
      onPageChanged: (int index,reason){
        setState(() {
          _currentIndex = index;
        });
      }
      ));
  }

  Widget _getSearch(){
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(padding: EdgeInsets.all(10),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: 40,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0.4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text("搜索...",style:TextStyle(color: Colors.white,fontSize: 16))
      ),
    ));
  }

  Widget _getDots(){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:List.generate(widget.banners.length, (int index){
            return GestureDetector(
              onTap: (){
                _controller.jumpToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 6,
                width: index == _currentIndex ? 40:20,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: index == _currentIndex ? Colors.white:Color.fromRGBO(0,0,0,0.3),
                  borderRadius: BorderRadius.circular(3),
              ),
            ));         
            
        })
        ),
      ));
  }
  @override
  Widget build(BuildContext context) {
    //stack -> 轮播图 搜索框 指示灯导航
    return Stack(
      children: [_getSlider(),_getSearch(),_getDots()],
    );
    // return Container(
    //   color: Colors.blue,
    //   height: 300,
    //   alignment: Alignment.center,
    //    child: Text("轮播图",style: TextStyle(fontSize: 20,color: Colors.white),),
    // );
  }
}