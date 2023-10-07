import 'package:douban/provider/view_state_list_model.dart';

class MeModel extends ViewStateListModel {
  bool _isLogin = false;

  get isLogin => _isLogin;

  @override
  refresh() {
    // TODO: implement refresh
    throw UnimplementedError();
  }

  @override
  Future loadData() {
    // TODO: implement loadData
    return super.loadData();
  }
}
