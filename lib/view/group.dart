import 'package:douban/provider/provider_widget.dart';
import 'package:douban/view_model/group_model.dart';
import 'package:flutter/material.dart';

class Group extends StatefulWidget {
  const Group({Key? key}) : super(key: key);

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '我的小组',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    children: [Text('全部'), Icon(Icons.keyboard_arrow_right)],
                  )
                ],
              ),
              Container(
                height: 250,
                child: Center(
                  child: Text(
                    '加入小组,住进豆瓣',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '发现小组',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    children: [Text('更多'), Icon(Icons.keyboard_arrow_right)],
                  )
                ],
              ),
              Divider(),
              ProviderWidget<GroupModel>(
                model: GroupModel(),
                onModelReady: (model) => model.loadData(),
                builder: (context, model, child) {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model.list.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                      itemBuilder: (_, index) {
                        var data = model.list[index];
                        return _item(
                          groupName: data.groupName,
                          groupImg: data.groupImg,
                          count: data.count,
                          talkOne: data.talkOne,
                          talkOneCount: data.talkOneCount,
                          talkTwo: data.talkTwo,
                          talkTowCount: data.talkTowCount,
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _item({
  required String groupName,
  required String groupImg,
  required int count,
  required String talkOne,
  required int talkOneCount,
  required String talkTwo,
  required int talkTowCount,
}) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      groupImg,
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        groupName,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text('$count 成员')
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                '+ 申请',
                style: TextStyle(
                    color: Colors.green[500], fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        DefaultTextStyle(
          style: TextStyle(color: Colors.grey[700]),
          child: Container(
            padding: EdgeInsets.all(20),
            height: 100,
            width: double.infinity,
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.chat_bubble,
                          color: Colors.yellow[600],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('$talkOneCount'),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(talkOne),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.chat_bubble,
                                color: Colors.orange[600],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('$talkTowCount'),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: 250,
                              child: Text(
                                talkTwo,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
