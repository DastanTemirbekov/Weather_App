// class WeatherModel {
//   Coord? coord;
//   String? base;
//   Main? main;
//   String? name;
//   int? cod;

//   WeatherModel({this.coord, this.base, this.main, this.name, this.cod});

//   WeatherModel.fromJson(Map<String, dynamic> json) {
//     coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
//     base = json['base'];
//     main = json['main'] != null ? new Main.fromJson(json['main']) : null;
//     name = json['name'];
//     cod = json['cod'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.coord != null) {
//       data['coord'] = this.coord!.toJson();
//     }
//     data['base'] = this.base;
//     if (this.main != null) {
//       data['main'] = this.main!.toJson();
//     }
//     data['name'] = this.name;
//     data['cod'] = this.cod;
//     return data;
//   }
// }

// class Coord {
//   double? lon;
//   double? lat;

//   Coord({this.lon, this.lat});

//   Coord.fromJson(Map<String, dynamic> json) {
//     lon = json['lon'];
//     lat = json['lat'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lon'] = this.lon;
//     data['lat'] = this.lat;
//     return data;
//   }
// }

// class Main {
//   double? temp;
//   double? feelsLike;
//   int? grndLevel;

//   Main({this.temp, this.feelsLike, this.grndLevel});

//   Main.fromJson(Map<String, dynamic> json) {
//     temp = json['temp'];
//     feelsLike = json['feels_like'];
//     grndLevel = json['grnd_level'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['temp'] = this.temp;
//     data['feels_like'] = this.feelsLike;
//     data['grnd_level'] = this.grndLevel;
//     return data;
//   }
// }

// "wind": {
//   "speed": 1.82,
//   "deg": 327,
//   "gust": 1.22
// }


class WeatherModel {
  final String? cityName;
  final TemperatureInfo? tempInfo;
  final WeatherInfo? weatherInfo;
  final WindInfo? windInfo;
  final SunriseInfo? sunriseInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo?.icon}@2x.png';
  }

  WeatherModel(
      {this.cityName,
      this.tempInfo,
      this.weatherInfo,
      this.windInfo,
      this.sunriseInfo});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    final windInfoJson = json['wind'];
    final windInfo = WindInfo.fromJson(windInfoJson);

    final sunriseInfoJson = json['sys'];
    final sunriseInfo = SunriseInfo.fromJson(sunriseInfoJson);

    return WeatherModel(
        cityName: cityName,
        tempInfo: tempInfo,
        weatherInfo: weatherInfo,
        windInfo: windInfo,
        sunriseInfo: sunriseInfo);
  }
}

class TemperatureInfo {
  final double? temperature;
  final int? humidity;

  TemperatureInfo({this.temperature, this.humidity});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    final humidity = json['humidity'];
    return TemperatureInfo(temperature: temperature, humidity: humidity);
  }
}

class WindInfo {
  final double? wind;

  WindInfo({this.wind});

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    final wind = json['speed'];
    return WindInfo(wind: wind);
  }
}

class SunriseInfo {
  final DateTime? sunrise;
  final DateTime? sunset;
  SunriseInfo({this.sunrise, this.sunset});

  factory SunriseInfo.fromJson(Map<String, dynamic> json) {
    final sunrise = DateTime.fromMillisecondsSinceEpoch(json['sunrise']*1000);
    final sunset = DateTime.fromMillisecondsSinceEpoch(json['sunset']*1000);
    return SunriseInfo(sunrise: sunrise, sunset: sunset);
  }
}

class WeatherInfo {
  final String? description;
  final String? icon;

  WeatherInfo({this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}
