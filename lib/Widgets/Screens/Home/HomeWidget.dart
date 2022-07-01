import 'package:app_1/Widgets/Components/Movie_List.dart';
import 'package:app_1/Widgets/Components/Progress_Bar.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedTab = 0;

  void toggleTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TMDB"),
      ),
      body: IndexedStack(index: _selectedTab, children: [
        Text("News"),
        MovieList(),
        Example(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: toggleTab,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper), label: "Новости"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Фильмы"),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Сериалы"),
        ],
      ),
    );
  }
}
