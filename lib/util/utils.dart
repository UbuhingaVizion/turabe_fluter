import 'dart:math';

T getRandomElement<T>(List<T> list) {
  final random = new Random();
  var i = random.nextInt(list.length);
  return list[i];
}

class ForecastUtil {
  static String appId = "99f17ce910d92537de2f836c0a05b4f5";
}
