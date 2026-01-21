import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<BannerItem> _banners = [
    BannerItem(id: "1", imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg"),
    BannerItem(id: "2", imgUrl: "https://risun-tec.cn/ueditor/net/upload/image/20181117/6367806312985937509418879.jpg"),
    BannerItem(id: "3", imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg"),
  ];

  List<Widget> _getScrollChildren(){
    return[
      SliverToBoxAdapter(child: Padding(padding: EdgeInsets.symmetric(horizontal: 10,),child: Hmslider(banners: _banners,))),//轮播图组件
      SliverToBoxAdapter(child: SizedBox(height: 10,),),//间距组件
      SliverToBoxAdapter(child: Hmcategory()),//更多列表组件
      SliverToBoxAdapter(child: SizedBox(height: 10,),),//间距组件
      SliverToBoxAdapter(child: Padding(padding: EdgeInsets.symmetric(horizontal: 10,),
        child: Hmsuggestion(),
      )),//搜索建议组件
      //sliverGrid SliverList 只能纵向排列
      //ListView 
      SliverToBoxAdapter(child: SizedBox(height: 10,),),//间距组件
      SliverToBoxAdapter(
        child:Padding(padding: EdgeInsets.symmetric(horizontal: 10,),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Hmhot()),
              SizedBox(width: 10,),
              Expanded(child: Hmhot())
            ],
          ),
        )
      ),
      // SliverToBoxAdapter(child: Hmmorelist()),//更多列表组件
      SliverToBoxAdapter(child: SizedBox(height: 10,),),//间距组件
      Hmmorelist(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getScrollChildren(),
    );
  }
}