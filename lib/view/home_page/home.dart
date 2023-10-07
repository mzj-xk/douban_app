import 'package:flutter/material.dart';
import 'package:douban/view/home_page/recommendation.dart';
import 'package:douban/view/home_page/trends.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _tabs = [
    "动态",
    "推荐",
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
                  '奥本海默',
                  style: TextStyle(color: Colors.grey[400], fontSize: 18),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                indicatorWeight: 3,
                indicatorColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        body: const TabBarView(
          children: [Recommendation(), Trends()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.create),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
