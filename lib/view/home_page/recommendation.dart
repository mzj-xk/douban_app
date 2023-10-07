import 'package:douban/provider/provider_widget.dart';
import 'package:douban/provider/view_state_model.dart';
import 'package:douban/view_model/recommendation_model.dart';
import 'package:flutter/material.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({Key? key}) : super(key: key);

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation>
    with AutomaticKeepAliveClientMixin {
  // 保持页面状态,避免切换导致重复刷新
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: ProviderWidget<RecommendationModel>(
        model: RecommendationModel(),
        onModelReady: (model) => model.loadData(),
        builder: (context, model, child) {
          switch (model.state) {
            case ViewState.busy:
              return CircularProgressIndicator(color: Colors.green);
            case ViewState.done:
              return RefreshIndicator(
                color: Colors.green,
                onRefresh: model.loadData,
                child: ListView.separated(
                  separatorBuilder: (_, index) {
                    return const Divider(color: Colors.transparent);
                  },
                  itemCount: model.list.length,
                  itemBuilder: (_, index) {
                    var data = model.list[index];
                    return _item(
                        userName: data.userName,
                        avatarUrl: data.avatarUrl,
                        tag: data.tag,
                        content: data.content,
                        contentImg: data.contentImg,
                        likes: data.likes,
                        remark: data.remark,
                        share: data.share);
                  },
                ),
              );
            case ViewState.error:
              return Icon(Icons.error, color: Colors.green);
            case ViewState.empty:
              return Text('暂时还没有内容哦');
            default:
              return CircularProgressIndicator(color: Colors.green);
          }
        },
      ),
    );
  }
}

Widget _item(
    {required String userName,
    String avatarUrl = '',
    required String tag,
    required String content,
    String contentImg = '',
    required int likes,
    required int remark,
    required int share}) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            avatarUrl == ''
                ? ClipOval(
                    child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.green,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  )
                : ClipOval(
                    child: Image.network(
                      avatarUrl,
                      fit: BoxFit.fill,
                      width: 40,
                      height: 40,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                userName,
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 2, 0, 2),
          margin: EdgeInsets.all(5),
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.green[100],
          ),
          child: Text(
            // tag
            '# $tag',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green[800],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
            // content
            child: Text(
              content,
              style: TextStyle(fontSize: 23),
            )),
        Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 130,
                height: 130,
                child: Image.network(
                  contentImg,
                  fit: BoxFit.cover,
                ),
              ),
              // Container(
              //   width: 130,
              //   height: 130,
              //   margin: EdgeInsets.only(left: 5),
              //   child: Image.network(
              //     'https://inews.gtimg.com/news_bt/OWKa8f6EVQkIrE7x7rzlKXaTbffnQvRiMpIbLbQU5rg74AA/1000',
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  // likes
                  child: Text(likes.toString()),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.chat_bubble_outline,
                  size: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  // remark
                  child: Text(remark.toString()),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.sync,
                  size: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  // share
                  child: Text(share.toString()),
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
