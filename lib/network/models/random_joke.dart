import 'package:json_annotation/json_annotation.dart';

part 'random_joke.g.dart';

@JsonSerializable()
class RandomJoke {
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'icon_url')
  String iconUrl;
  String id;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  String url;
  String value;

  RandomJoke(
      {this.createdAt,
      this.iconUrl,
      this.id,
      this.updatedAt,
      this.url,
      this.value});

  factory RandomJoke.fromJson(Map<String, dynamic> json) =>
      _$RandomJokeFromJson(json);

  Map<String, dynamic> toJson() => _$RandomJokeToJson(this);
}
