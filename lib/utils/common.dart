import 'package:weather/utils/strings.dart';

import '../data/model/weather.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'images.dart';

AppBar homeAppbar(BuildContext context, String title){
  return AppBar(
    foregroundColor: primaryColor,
    backgroundColor: backgroundColor,
    leading: const Padding(padding: EdgeInsets.all(7), child: Image(image: AssetImage(ic_logo), fit: BoxFit.contain, height: 50, width: 50,),),
    title: text(text: title, color: primaryColor, size: 18),
  );
}

Widget weatherButton(BuildContext context, DayWeather weather, void Function(DayWeather weather) action){
  return Padding(
    padding: const EdgeInsets.all(7),
    child: SizedBox(
      width: 130,
      child: ElevatedButton(
        onPressed: () => action(weather),
        style: ElevatedButton.styleFrom(primary: backgroundColor, elevation: 5, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13),),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            remoteImage(context, weather.weather[0].icon ?? "01d"),
            const SizedBox(
              height: 10,
            ),
            Text((weather.weather[0].main ?? "Normal").toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 13,
                  fontFamily: "Comfortaa",
                  fontWeight: FontWeight.w900
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget text({required String text, double size = 17, Color? color, bool bold = false, align = TextAlign.start}){
  return Text(text,
    textAlign: align,
    style: TextStyle(
        fontSize: size,
        fontFamily: "Comfortaa",
        color: color ?? primaryColor,
        fontWeight: bold ? FontWeight.w900 : FontWeight.w700
    ),
  );
}

void loadingDialog(BuildContext context){
  showDialog(context: context, barrierDismissible: false, useSafeArea: true, builder: (_) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      ),
    );
  });
}

void messageDialog(BuildContext context, String message, bool isError){
  showDialog(context: context, barrierDismissible: false, useSafeArea: true, builder: (_) {
    return Center(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 50,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(isError ? Icons.report_gmailerrorred_rounded : Icons.task_alt_rounded, color: isError ? errorColor : successColor, size: 63,),
                const SizedBox(height: 16,),
                text(text: message, bold: false, color: isError ? errorColor : successColor, align: TextAlign.center),
                const SizedBox(height: 16,),
                coloredButton(ok, isError ? errorColor : successColor, () => Navigator.pop(context))
              ],
            ),
          ),
        ),
      ),
    );
  });
}

Widget coloredButton(String label, Color? color, Function() action){
  return Padding(
    padding: const EdgeInsets.all(5),
    child: ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 50,
        minWidth: double.maxFinite,
      ),
      child: ElevatedButton(
          onPressed: action,
          style: ElevatedButton.styleFrom(primary: color ?? primaryColor, elevation: 5, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),),),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(label.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: backgroundColor,
                  fontSize: 15,
                  fontFamily: "Comfortaa",
                  fontWeight: FontWeight.w800
              ),
            ),
          )
      ),
    ),
  );
}

Widget remoteImage(BuildContext context, String image){
  return ClipRRect(
    child: Image(image: NetworkImage("https://openweathermap.org/img/w/$image.png"), fit: BoxFit.fill,),
  );
}