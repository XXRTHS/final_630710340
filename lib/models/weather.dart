class Weather {
  final String city;
  final String country;
  final String lastUpdate;
  final double tempC;
  final double tempF;
  final double feelLikeC;
  final double feelLikeF;
  final double windKph;
  final double windMph;
  final double humidity;
  final int uv;
  final WeatherCondition condition;


  Weather({
    required this.city,
    required this.country,
    required this.lastUpdate,
    required this.tempC,
    required this.tempF,
    required this.feelLikeC,
    required this.feelLikeF,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.uv,
    required this.condition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['city'],
      country: json['country'],
      lastUpdate: json['lastUpdate'],
      tempC: json['tempC'],
      tempF: json['tempF'],
      feelLikeC: json['feelLikeC'],
      feelLikeF: json['feelLikeF'],
      windKph: json['windKph'],
      windMph: json['windMph'],
      humidity: json['humidity'],
      uv: json['uv'],
      condition: WeatherCondition.fromJson(json['condition']),
    );
  }
}

class WeatherCondition {
  final String text;
  final String icon;
  final int code;

  WeatherCondition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) {
    return WeatherCondition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}