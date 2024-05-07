// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'],
      url: json['url'] as String,
      urlToImage: json['urlToImage'],
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      content: json['content'] as String,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'content': instance.content,
    };

_$SourceImpl _$$SourceImplFromJson(Map<String, dynamic> json) => _$SourceImpl(
      id: json['id'],
      name: json['name'] as String,
    );

Map<String, dynamic> _$$SourceImplToJson(_$SourceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
