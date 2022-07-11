import 'package:weather/data/repository/weather_repository.dart';
import '../../data/model/weather.dart';

final _repository = WeatherRepository();

Future<Weather?> getWeekWeather() async => _repository.getWeekWeather();