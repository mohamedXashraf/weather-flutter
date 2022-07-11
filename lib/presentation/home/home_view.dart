import 'package:flutter/material.dart';
import 'package:weather/data/model/weather.dart';
import 'package:weather/presentation/home/home_view_intent.dart';
import 'package:weather/presentation/home/home_view_state.dart';
import 'package:weather/utils/colors.dart';
import 'package:weather/utils/common.dart';
import 'package:weather/utils/strings.dart';
import 'home_viewmodel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _viewModel = HomeViewModel();
  Weather? weather;
  DayWeather? selectedWeather;

  @override
  void initState() {
    super.initState();
    _viewModel.subscribe((state) {
      Navigator.pop(context);
      switch (state.runtimeType){
        case WeatherDataState:{
          setState(() {
            weather = (state as WeatherDataState).weather;
            if (weather != null && weather!.list.isNotEmpty) {
              selectedWeather = weather?.list[0];
            } else {
              selectedWeather = null;
            }
          });
        }
        break;
        case ErrorState:{
          messageDialog(context, (state as ErrorState).error, true);
        }
        break;
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      loadingDialog(context);
      _viewModel.doIntent(GetWeatherIntent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: homeAppbar(context, app_name),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Visibility(
                visible: weather != null,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: weather?.list.length ?? 0,
                  itemBuilder: (context, index) {
                    return weatherButton(context, weather!.list[index], _weatherSelectionListener);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Visibility(
                visible: selectedWeather != null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    remoteImage(context, selectedWeather?.weather[0].icon ?? "01d"),
                    const SizedBox(height: 10,),
                    text(text: selectedWeather?.weather[0].main ?? "Normal", bold: true),
                    text(text: "${selectedWeather?.temp?.max.toString() ?? "0"} C", size: 14),
                    text(text: "${selectedWeather?.temp?.min.toString() ?? "0"} C", size: 14),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  void _weatherSelectionListener(DayWeather weather) {
    setState(() {
      selectedWeather = weather;
    });
  }
}
