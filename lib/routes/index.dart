//管理路由
import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/main.dart';
//返回App根极组件
Widget getRootWidget(){
  return MaterialApp(
    routes:getRootRoutes(),
  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes(){
  return{
    "/":(context)=>MainPage(),
    "/login":(context)=>LoginPage(),
  };
}
