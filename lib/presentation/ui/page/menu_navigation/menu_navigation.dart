import 'package:flutter/material.dart';
import 'package:movie_tv/presentation/ui/page/dashboard/dashboard_page.dart';
import 'package:movie_tv/presentation/ui/page/profile/profile_page.dart';
import 'package:movie_tv/presentation/ui/page/tv_series/tv_series_page.dart';

class MenuNavigationPage extends StatefulWidget {
  const MenuNavigationPage({Key? key}) : super(key: key);

  @override
  State<MenuNavigationPage> createState() => _MenuNavigationPageState();
}

class _MenuNavigationPageState extends State<MenuNavigationPage> {
  int _selectIndex = 0;

  static const List<Widget> _listWidget = <Widget>[
    DashboardPage(),
    TvSeriesPage(),
    ProfilePage()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectIndex,
          onTap: _onItemTap,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: 'Tv Series',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
