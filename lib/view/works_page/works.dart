import 'package:douban/view/works_page/location.dart';
import 'package:douban/view/works_page/movie.dart';
import 'package:douban/view/works_page/music.dart';
import 'package:douban/view/works_page/read.dart';
import 'package:douban/view/works_page/serialize.dart';
import 'package:douban/view/works_page/tv.dart';
import 'package:flutter/material.dart';

class Works extends StatefulWidget {
  const Works({Key? key}) : super(key: key);

  @override
  State<Works> createState() => _WorksState();
}

class _WorksState extends State<Works> {
  List<String> _tabs = [
    '电影',
    '电视',
    '读书',
    '连载',
    '音乐',
    '同城',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.menu),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.mail_outline),
              )
            ],
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey[400],
                  ),
                  Text(
                    "奥本海默",
                    style: TextStyle(color: Colors.grey[400], fontSize: 18),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40.0),
              child: Container(
                alignment: Alignment.center,
                child: TabBar(
                  // isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  indicatorWeight: 3,
                  indicatorColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  tabs: List.generate(
                    _tabs.length,
                    (index) => Tab(
                      text: _tabs[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: const TabBarView(children: [
            Movie(),
            TV(),
            Read(),
            Serialize(),
            Music(),
            Location(),
          ]),
        ));
  }
}
