import 'package:json_annotation/json_annotation.dart';
part 'search.g.dart';

@JsonSerializable()
class Search {
  int total;
  List<Result> result;

  Search({this.total, this.result});

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}

@JsonSerializable()
class Result {
  List<Object> categories;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'icon_url')
  String iconUrl;
  String id;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  String url;
  String value;

  Result(
      {this.categories,
      this.createdAt,
      this.iconUrl,
      this.id,
      this.updatedAt,
      this.url,
      this.value});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
