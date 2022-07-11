import 'package:weather/data/model/weather.dart';

class HomeViewState { }

class WeatherDataState extends HomeViewState {
  Weather weather;
  WeatherDataState(this.weather);
}

class ErrorState extends HomeViewState {
  String error = "";
  ErrorState(this.error);
}