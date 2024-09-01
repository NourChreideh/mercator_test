class ArticlesReqModel{
  dynamic id;
  dynamic authorId;
  dynamic start;
  dynamic end;
  dynamic keywordId;
  bool onlyWithSource;
  String type;
  String platform;
  bool isLatin;

  ArticlesReqModel({
    required this.id,
    required this.authorId,
    required this.start,
    required this.end,
    required this.keywordId,
    required this.onlyWithSource,
    required this.type,
    required this.platform,
    required this.isLatin,
  });


  factory ArticlesReqModel.fromJson(Map<String, dynamic> json) {
    return ArticlesReqModel(
      id: json['id'] ,
      authorId: json['authorId'] ,
      start: json['start'] ,
      end: json['end'] ,
      keywordId: json['keywordId'],
      onlyWithSource: json['onlyWithSource'] ,
      type: json['type'] ?? '',
      platform: json['platform'] ?? '',
      isLatin: json['isLatin'] ,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'authorId': authorId,
      'start': start,
      'end': end,
      'keywordId': keywordId,
      'onlyWithSource': onlyWithSource,
      'type': type,
      'platform': platform,
      'isLatin': isLatin,
    };
  }
}

