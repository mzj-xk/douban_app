import 'package:douban/dio_util/dio_method.dart';
import 'package:douban/dio_util/dio_util.dart';
import 'package:douban/model/group_bean.dart';
import 'package:douban/model/movie_bean.dart';
import 'package:douban/model/recommendation_bean.dart';

class DouBanRepository {
  // static String baseUrl = 'http://localhost:8000/';
  // static Dio _dio = Dio();

  static Future fetchRecommendation() async {
    // DioUtil.getInstance()?.openLog();
    var response =
        await DioUtil().request('/recommendation/', method: DioMethod.get);
    return RecommendationBean.fromJson(response);
  }

  static Future fetchGroup() async {
    var response = await DioUtil().request('/group', method: DioMethod.get);
    return GroupBean.fromJson(response);
  }

  static Future fetchMovie() async {
    var response =
        await DioUtil().request('/movie/cinemas/hot', method: DioMethod.get);
    return MovieBean.fromJson(response);
  }
}
