import 'package:douban/provider/provider_widget.dart';
import 'package:douban/view_model/me_model.dart';
import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  const Me({Key? key}) : super(key: key);

  @override
  State<Me> createState() => _MeState();
}

class _MeState extends State<Me> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<MeModel>(
      model: MeModel(),
      onModelReady: (model) => model.loadData(),
      builder: (_, model, child) {
        if (model.isLogin) {
          return Center(
            child: Text('欢迎回来'),
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Image.network(
                        'https://img0.baidu.com/it/u=645505420,1762999555&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
                        fit: BoxFit.fill,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Kamaka',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    width: 300,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          shadowColor: Colors.transparent,
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.all(
                          //     Radius.circular(5),
                          //   ),
                          // ),
                          side: BorderSide(width: .1)),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('登录该账号'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 300,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          primary: Colors.black,
                          shadowColor: Colors.transparent,
                          side: BorderSide(width: .1)),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('其它方式登录'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
