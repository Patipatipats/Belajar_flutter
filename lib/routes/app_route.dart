
import 'package:flutter/material.dart';

// HALAMAN LATIHAN
import 'package:belajar_flutter/latihan/latihan3.dart';
import 'package:belajar_flutter/latihan/gridinstagram.dart';

// HALAMAN PAGES
import 'package:belajar_flutter/pages/home_page.dart';
import 'package:belajar_flutter/pages/about_page.dart';
import 'package:belajar_flutter/pages/input_form.dart';
import 'package:belajar_flutter/pages/input_eskul.dart';

// HALAMAN LIST
import 'package:belajar_flutter/list_grid_view/article_list_screen.dart';

// HALAMAN TUGAS AI
import 'package:belajar_flutter/tugasai/daftar_wisata.dart';

class AppRoute {
  // NAMA ROUTE
  static const String home = '/';
  static const String articleList = '/article-list';
  static const String about = '/about';
  static const String ig = '/instagram';
  static const String lat3 = '/lat3';
  static const String form = '/form';
  static const String eskul = '/eskul';
  static const String wisata = '/wisata';

  // DAFTAR ROUTE
  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),

    articleList: (context) => const ArticleListScreen(),

    about: (context) => const AboutPage(),

    ig: (context) => const Gridinstagram(),

    lat3: (context) => const Latihan3(),

    form: (context) => const BelajarForm(),

    eskul: (context) => const FormEskul(),

    // HALAMAN DAFTAR WISATA
    wisata: (context) => const DaftarWisata(),
  };
}
