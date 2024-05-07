// To parse this JSON data, do
//
//     final movievedios = movievediosFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_model.freezed.dart';
part 'api_model.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    @JsonKey(name: "source") required Source source,
    @JsonKey(name: "author") required String? author,
    @JsonKey(name: "title") required String? title,
    @JsonKey(name: "description") required dynamic description,
    @JsonKey(name: "url") required String url,
    @JsonKey(name: "urlToImage") required dynamic urlToImage,
    @JsonKey(name: "publishedAt") required DateTime publishedAt,
    @JsonKey(name: "content") required String content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    @JsonKey(name: "id") required dynamic id,
    @JsonKey(name: "name") required String name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
