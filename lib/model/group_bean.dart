class GroupBean {
  int? code;
  String? message;
  Result? result;

  GroupBean({this.code, this.message, this.result});

  GroupBean.fromJson(Map<String, dynamic> json) {
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
  String? groupName;
  String? groupImg;
  int? count;
  String? talkOne;
  int? talkOneCount;
  String? talkTwo;
  int? talkTowCount;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.groupName,
      this.groupImg,
      this.count,
      this.talkOne,
      this.talkOneCount,
      this.talkTwo,
      this.talkTowCount,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupName = json['group_name'];
    groupImg = json['group_img'];
    count = json['count'];
    talkOne = json['talk_one'];
    talkOneCount = json['talk_one_count'];
    talkTwo = json['talk_two'];
    talkTowCount = json['talk_tow_count'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_name'] = this.groupName;
    data['group_img'] = this.groupImg;
    data['count'] = this.count;
    data['talk_one'] = this.talkOne;
    data['talk_one_count'] = this.talkOneCount;
    data['talk_two'] = this.talkTwo;
    data['talk_tow_count'] = this.talkTowCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
