import 'package:douban/provider/provider_widget.dart';
import 'package:douban/view_model/movie_model.dart';
import 'package:flutter/material.dart';

class Movie extends StatefulWidget {
  const Movie({Key? key}) : super(key: key);

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _topCard(Icon(Icons.search, color: Colors.red), '找电影'),
                _topCard(
                    Icon(Icons.equalizer, color: Colors.yellow[500]), '豆瓣榜单'),
                _topCard(Icon(Icons.access_time, color: Colors.green), '即将上映'),
                _topCard(Icon(Icons.subscriptions), '豆瓣片单'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('影院热映',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '|',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('豆瓣热门',
                          style: TextStyle(color: Colors.grey, fontSize: 25)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('全部 74 ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ProviderWidget<MovieModel>(
                  model: MovieModel(),
                  onModelReady: (model) => model.loadData(),
                  builder: (context, model, child) {
                    return SizedBox(
                      height: 230,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: model.list.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (_, index) {
                            var data = model.list[index];
                            return _movieCard(
                                data.movieName, data.movieImg, data.score);
                          }),
                    );
                  },
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: 180,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.1),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '国内即将上映',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '近期有6部热门电影',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 50,
                            child: Image.network(
                              'https://bkimg.cdn.bcebos.com/pic/203fb80e7bec54e736d1ff092e6f8c504fc2d5623cd6?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxODA=,g_7,xp_5,yp_5/format,f_auto',
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: 180,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.1),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '全球最值得期待',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '近期有7部热门电影',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 50,
                            child: Image.network(
                              'https://img2.baidu.com/it/u=755622244,2250852781&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=625',
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _topCard(Icon icon, String label) {
  return Container(
    margin: EdgeInsets.fromLTRB(5, 20, 5, 0),
    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    width: 90,
    height: 70,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey[300] as Color),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        icon,
        Text(label, style: TextStyle(color: Colors.grey[900])),
      ],
    ),
  );
}

Widget _movieCard(String name, String url, num score) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            width: 130,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 15,
            left: 15,
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          )
        ],
      ),
      Text(
        name,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      Row(
        children: [
          Container(
            height: 20,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (index) {
                return index + 1 < score / 2
                    ? Icon(Icons.star, size: 15, color: Colors.orange)
                    : Icon(Icons.star_border, size: 15, color: Colors.orange);
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              '${score is int ? score.toDouble() : score}',
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      )
    ],
  );
}
