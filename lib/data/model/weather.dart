import 'package:json_annotation/json_annotation.dart';
part 'weather.g.dart';


@JsonSerializable()
class Weather {
  City? city;
  String? cod;
  double? message;
  int? cnt;
  List<DayWeather> list = <DayWeather>[];

  Weather();

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Coordinate {
  double? lon;
  double? lat;

  Coordinate();

  factory Coordinate.fromJson(Map<String, dynamic> json) => _$CoordinateFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinateToJson(this);
}

@JsonSerializable()
class City {
  int? id;
  String? name;
  Coordinate? coordinate;
  String? country;
  int? population;
  int? timezone;

  City();

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Temp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp();

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);
  Map<String, dynamic> toJson() => _$TempToJson(this);
}

@JsonSerializable()
class FeelsLike {
  double? day;
  double? night;
  double? eve;
  double? morn;

  FeelsLike();

  factory FeelsLike.fromJson(Map<String, dynamic> json) => _$FeelsLikeFromJson(json);
  Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);
}

@JsonSerializable()
class WeatherItem {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherItem();

  factory WeatherItem.fromJson(Map<String, dynamic> json) => _$WeatherItemFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherItemToJson(this);
}

@JsonSerializable()
class DayWeather {
  int? dt;
  int? sunrise;
  int? sunset;
  Temp? temp;
  FeelsLike? feelsLike;
  double? pressure;
  int? humidity;
  List<WeatherItem> weather = <WeatherItem>[];
  double? speed;
  int? deg;
  double? gust;
  int? clouds;
  double? pop;

  DayWeather();

  factory DayWeather.fromJson(Map<String, dynamic> json) => _$DayWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$DayWeatherToJson(this);
}
