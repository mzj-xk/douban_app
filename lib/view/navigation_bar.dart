import 'package:douban/view/group.dart';
import 'package:douban/view/market.dart';
import 'package:douban/view/me.dart';
import 'package:douban/view/works_page/works.dart';
import 'package:flutter/material.dart';
import 'package:douban/view/home_page/home.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<Widget> _pageList = [
    Home(),
    Works(),
    Group(),
    Market(),
    Me(),
  ];
  int _index = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (_, index) => _pageList[index],
        itemCount: _pageList.length,
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // item > 3 要加这个参数
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        iconSize: 40,
        onTap: (index) {
          setState(() {
            _index = index;
          });
          _controller.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: '书影音', icon: Icon(Icons.music_note)),
          BottomNavigationBarItem(
              label: '小组', icon: Icon(Icons.outdoor_grill_sharp)),
          BottomNavigationBarItem(label: '市集', icon: Icon(Icons.margin)),
          BottomNavigationBarItem(label: '我', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
