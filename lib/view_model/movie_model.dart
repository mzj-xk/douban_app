import 'package:douban/model/movie_bean.dart';
import 'package:douban/provider/view_state_list_model.dart';
import 'package:douban/service/douban_repository.dart';

class MovieModel extends ViewStateListModel {
  late MovieBean data;
  @override
  refresh() async {
    data = await DouBanRepository.fetchMovie();
    list = data.result!.list!;
    // DouBanRepository.fetchMovie().then((value) => print(value));
  }
}
