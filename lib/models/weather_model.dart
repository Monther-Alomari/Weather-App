class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.image,
    required this.date,
    required this.temp,
    required this.weatherCondition,
    required this.maxTemp,
    required this.minTemp,
  });
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        date: DateTime.parse(json['current']['last_updated']),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c']);
  }
}
