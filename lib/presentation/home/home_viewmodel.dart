import 'package:weather/domain/usecase/get_weather.dart' as usecase;
import 'package:weather/presentation/base/ViewModel.dart';
import 'package:weather/presentation/home/home_view_intent.dart';
import 'package:weather/presentation/home/home_view_state.dart';
import 'package:weather/utils/strings.dart';

class HomeViewModel extends ViewModel<HomeViewIntent, HomeViewState> {

  HomeViewModel() {
    intents((intent) {
      switch (intent.runtimeType){
        case GetWeatherIntent:{
          _getWeather();
        }
        break;
      }
    });
  }

  void _getWeather() async {
    var weather = await usecase.getWeekWeather();
    if (weather != null) {
      publish(WeatherDataState(weather));
    } else {
      publish(ErrorState(general_error));
    }
  }
}