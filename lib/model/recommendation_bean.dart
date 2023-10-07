class RecommendationBean {
  int? code;
  String? message;
  Result? result;

  RecommendationBean({this.code, this.message, this.result});

  RecommendationBean.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  int? pageNum;
  int? pageSize;
  int? total;
  List<Recommendation>? list;

  Result({this.pageNum, this.pageSize, this.total, this.list});

  Result.fromJson(Map<String, dynamic> json) {
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    total = json['total'];
    if (json['list'] != null) {
      list = <Recommendation>[];
      json['list'].forEach((v) {
        list!.add(new Recommendation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNum'] = this.pageNum;
    data['pageSize'] = this.pageSize;
    data['total'] = this.total;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recommendation {
  int? id;
  String? userName;
  String? avatarUrl;
  String? tag;
  String? content;
  String? contentImg;
  int? likes;
  int? remark;
  int? share;
  String? createdAt;
  String? updatedAt;

  Recommendation(
      {this.id,
      this.userName,
      this.avatarUrl,
      this.tag,
      this.content,
      this.contentImg,
      this.likes,
      this.remark,
      this.share,
      this.createdAt,
      this.updatedAt});

  Recommendation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    avatarUrl = json['avatar_url'];
    tag = json['tag'];
    content = json['content'];
    contentImg = json['content_img'];
    likes = json['likes'];
    remark = json['remark'];
    share = json['share'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['avatar_url'] = this.avatarUrl;
    data['tag'] = this.tag;
    data['content'] = this.content;
    data['content'] = this.contentImg;
    data['likes'] = this.likes;
    data['remark'] = this.remark;
    data['share'] = this.share;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
