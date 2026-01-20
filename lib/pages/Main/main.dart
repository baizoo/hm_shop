import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/My/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 定义数据 根据数据进行渲染4个导航
  // 一般应用程序的导航是固定的 用final
  final List<Map<String,dynamic>> _tabList=[
    {"name":"首页","icon":"lib/assets/ic_public_home_normal.png","activeIcon":"lib/assets/ic_public_home_active.png"},
    {"name":"分类","icon":"lib/assets/ic_public_pro_normal.png","activeIcon":"lib/assets/ic_public_pro_active.png"},
    {"name":"购物车","icon":"lib/assets/ic_public_cart_normal.png","activeIcon":"lib/assets/ic_public_cart_active.png"},  
    {"name":"我的","icon":"lib/assets/ic_public_my_normal.png","activeIcon":"lib/assets/ic_public_my_active.png"},
  ];
  // 定义当前选中的索引
  int _currentIndex=0;
  List<Widget> _getChildren(){
    return [
      HomeView(),
      CategoryView(),
      CartView(),
      MyView(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // safearea 避开安全区组件
      body:SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _getChildren(),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,

        onTap: (index){          
          setState(() {
            _currentIndex=index;
          });
        },
        currentIndex: _currentIndex,

        items: _tabList.map((item){
          return BottomNavigationBarItem(
            icon: Image.asset(item["icon"],width: 30,height: 30,),
            activeIcon: Image.asset(item["activeIcon"],width: 30,height: 30,),
            label: item["name"],
          );
        }).toList(),
        

      ),
    );
  }
}