// To parse this JSON data, do
//
//     final movievedios = movievediosFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_model.freezed.dart';
part 'api_model.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required Source source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required DateTime publishedAt,
    required String content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    required String? id,
    required String name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
