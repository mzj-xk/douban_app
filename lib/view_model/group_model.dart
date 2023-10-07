import 'package:douban/model/group_bean.dart';
import 'package:douban/provider/view_state_list_model.dart';
import 'package:douban/service/douban_repository.dart';

class GroupModel extends ViewStateListModel {
  late GroupBean data;
  @override
  refresh() async {
    data = await DouBanRepository.fetchGroup();
    list = data.result!.list!;
  }
}
