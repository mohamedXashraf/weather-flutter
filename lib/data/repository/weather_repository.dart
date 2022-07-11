import 'package:weather/data/api/weather_apis.dart' as weatherAPIs;
import '../model/weather.dart';

class WeatherRepository {

  Future<Weather?> getWeekWeather() async => weatherAPIs.get();
}