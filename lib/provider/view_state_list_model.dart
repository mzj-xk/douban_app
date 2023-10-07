import 'package:douban/provider/view_state_model.dart';

abstract class ViewStateListModel<T> extends ViewStateModel {
  // 页面数据
  List<T> list = [];

  // 所有view_model的统一刷新方法
  refresh();

  // 统一的初始化数据方法
  Future loadData() async {
    setBusy();
    try {
      // await Future.delayed(Duration(seconds: 6));
      await refresh();
      if (list.isNotEmpty) {
        setDone();
      } else {
        setEmpty();
      }
    } catch (err) {
      setError();
    }
  }
}
