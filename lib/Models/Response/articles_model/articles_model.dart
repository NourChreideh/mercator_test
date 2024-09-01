import 'article.dart';

class ArticlesModel {
  bool? hasNextPage;
  List<Article>? articles;

  ArticlesModel({this.hasNextPage, this.articles});

  @override
  String toString() {
    return 'ArticlesModel(hasNextPage: $hasNextPage, articles: $articles)';
  }

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
        hasNextPage: json['hasNextPage'] as bool?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'hasNextPage': hasNextPage,
        'articles': articles?.map((e) => e.toJson()).toList(),
      };
}
