import 'package:belajar_flutter/latihan/latihan3.dart';
import 'package:belajar_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/list_grid_view/article_list_screen.dart';
import 'package:belajar_flutter/pages/about_page.dart';
import 'package:belajar_flutter/latihan/gridinstagram.dart';
// import 'package:belajar_flutter/list_grid_view/article_list_screen.dart';

class AppRoute {
  static const home = '/';
  static const articleList = '/article-list';
  static const about = '/about';
  static const ig = '/instagram';
  static const lat3 = '/lat3';

  static Map<String, WidgetBuilder> routes = {

    home:(context) => const HomePage(),
    articleList: (context) => const ArticleListScreen(),
    about: (context) => const AboutPage(),
    ig: (context) => const Gridinstagram(), 
    lat3: (context) => const Latihan3(),
  };
}
