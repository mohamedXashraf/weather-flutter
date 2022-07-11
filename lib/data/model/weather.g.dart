// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather()
  ..city = json['city'] == null
      ? null
      : City.fromJson(json['city'] as Map<String, dynamic>)
  ..cod = json['cod'] as String?
  ..message = (json['message'] as num?)?.toDouble()
  ..cnt = json['cnt'] as int?
  ..list = (json['list'] as List<dynamic>)
      .map((e) => DayWeather.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'city': instance.city,
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
    };

Coordinate _$CoordinateFromJson(Map<String, dynamic> json) => Coordinate()
  ..lon = (json['lon'] as num?)?.toDouble()
  ..lat = (json['lat'] as num?)?.toDouble();

Map<String, dynamic> _$CoordinateToJson(Coordinate instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

City _$CityFromJson(Map<String, dynamic> json) => City()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..coordinate = json['coordinate'] == null
      ? null
      : Coordinate.fromJson(json['coordinate'] as Map<String, dynamic>)
  ..country = json['country'] as String?
  ..population = json['population'] as int?
  ..timezone = json['timezone'] as int?;

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coordinate': instance.coordinate,
      'country': instance.country,
      'population': instance.population,
      'timezone': instance.timezone,
    };

Temp _$TempFromJson(Map<String, dynamic> json) => Temp()
  ..day = (json['day'] as num?)?.toDouble()
  ..min = (json['min'] as num?)?.toDouble()
  ..max = (json['max'] as num?)?.toDouble()
  ..night = (json['night'] as num?)?.toDouble()
  ..eve = (json['eve'] as num?)?.toDouble()
  ..morn = (json['morn'] as num?)?.toDouble();

Map<String, dynamic> _$TempToJson(Temp instance) => <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };

FeelsLike _$FeelsLikeFromJson(Map<String, dynamic> json) => FeelsLike()
  ..day = (json['day'] as num?)?.toDouble()
  ..night = (json['night'] as num?)?.toDouble()
  ..eve = (json['eve'] as num?)?.toDouble()
  ..morn = (json['morn'] as num?)?.toDouble();

Map<String, dynamic> _$FeelsLikeToJson(FeelsLike instance) => <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };

WeatherItem _$WeatherItemFromJson(Map<String, dynamic> json) => WeatherItem()
  ..id = json['id'] as int?
  ..main = json['main'] as String?
  ..description = json['description'] as String?
  ..icon = json['icon'] as String?;

Map<String, dynamic> _$WeatherItemToJson(WeatherItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

DayWeather _$DayWeatherFromJson(Map<String, dynamic> json) => DayWeather()
  ..dt = json['dt'] as int?
  ..sunrise = json['sunrise'] as int?
  ..sunset = json['sunset'] as int?
  ..temp = json['temp'] == null
      ? null
      : Temp.fromJson(json['temp'] as Map<String, dynamic>)
  ..feelsLike = json['feelsLike'] == null
      ? null
      : FeelsLike.fromJson(json['feelsLike'] as Map<String, dynamic>)
  ..pressure = (json['pressure'] as num?)?.toDouble()
  ..humidity = json['humidity'] as int?
  ..weather = (json['weather'] as List<dynamic>)
      .map((e) => WeatherItem.fromJson(e as Map<String, dynamic>))
      .toList()
  ..speed = (json['speed'] as num?)?.toDouble()
  ..deg = json['deg'] as int?
  ..gust = (json['gust'] as num?)?.toDouble()
  ..clouds = json['clouds'] as int?
  ..pop = (json['pop'] as num?)?.toDouble();

Map<String, dynamic> _$DayWeatherToJson(DayWeather instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'weather': instance.weather,
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
      'clouds': instance.clouds,
      'pop': instance.pop,
    };
