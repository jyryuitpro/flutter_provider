import 'package:flutter/material.dart';
import 'package:flutter_provider/home_page.dart';
import 'package:flutter_provider/home_page_post.dart';
import 'package:provider/provider.dart';

var theme = ThemeData(
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontSize: 22,
      height: 1.4,
    ),
    caption: TextStyle(
      fontSize: 18,
      height: 1.4
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<List<HomePagePost>>(create: (BuildContext context) => _homePagePosts),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: const HomePage(),
      ),
    );
  }
}

final _homePagePosts = [
  HomePagePost(title: 'What is provider?', date: DateTime(2021, 11, 10),),
  HomePagePost(title: 'What is multi_provider?', date: DateTime(2021, 12, 10),),
];


