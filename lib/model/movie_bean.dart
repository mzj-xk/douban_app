class MovieBean {
  int? code;
  String? message;
  Result? result;

  MovieBean({this.code, this.message, this.result});

  MovieBean.fromJson(Map<String, dynamic> json) {
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
  List<Data>? list;

  Result({this.pageNum, this.pageSize, this.total, this.list});

  Result.fromJson(Map<String, dynamic> json) {
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    total = json['total'];
    if (json['list'] != null) {
      list = <Data>[];
      json['list'].forEach((v) {
        list!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? movieName;
  String? movieImg;
  num? score;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.movieName,
      this.movieImg,
      this.score,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movieName = json['movie_name'];
    movieImg = json['movie_img'];
    score = json['score'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['movie_name'] = this.movieName;
    data['movie_img'] = this.movieImg;
    data['score'] = this.score;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
