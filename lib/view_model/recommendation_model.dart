import 'package:douban/model/recommendation_bean.dart';
import 'package:douban/service/douban_repository.dart';
import 'package:douban/provider/view_state_list_model.dart';

class RecommendationModel<Recommendation> extends ViewStateListModel {
  late RecommendationBean data;
  @override
  refresh() async {
    data = await DouBanRepository.fetchRecommendation();
    list = data.result!.list!;
  }
}
