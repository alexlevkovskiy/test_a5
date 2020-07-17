// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_joke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomJoke _$RandomJokeFromJson(Map<String, dynamic> json) {
  return RandomJoke(
      createdAt: json['created_at'] as String,
      iconUrl: json['icon_url'] as String,
      id: json['id'] as String,
      updatedAt: json['updated_at'] as String,
      url: json['url'] as String,
      value: json['value'] as String);
}

Map<String, dynamic> _$RandomJokeToJson(RandomJoke instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'icon_url': instance.iconUrl,
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'url': instance.url,
      'value': instance.value
    };
