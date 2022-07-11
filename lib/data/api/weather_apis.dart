import 'package:dio/dio.dart';
import 'package:weather/data/model/weather.dart';

const _baseUrl = "https://api.openweathermap.org/data/2.5/forecast/";
const _apiKey = "92c8fc9f16eeee3a87ce33bffc3d939a";
const _country = "cairo";
const _days = "7";
const _measuringUnits = "metric";

Future<Weather?> get() async {
  var url = "${_baseUrl}daily?q=$_country&cnt=$_days&units=$_measuringUnits&appid=$_apiKey";
  try {
    var response = await Dio().get(url);
    print(response.data.toString());
    return Weather.fromJson(response.data);
  } catch (e) {
    print(e);
    return null;
  }
}