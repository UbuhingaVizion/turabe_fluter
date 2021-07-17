class WeatherForecastModel {
  String cod;
  int message;
  City city;
  int cnt;
  List<Lista> list;

  WeatherForecastModel(
      {this.cod, this.message, this.city, this.cnt, this.list});

  WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = new List<Lista>();
      json['list'].forEach((v) {
        list.add(new Lista.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = this.cod;
    data['message'] = this.message;
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['cnt'] = this.cnt;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int geonameId;
  String name;
  double lat;
  double lon;
  String country;
  String iso2;
  String type;
  int population;

  City(
      {this.geonameId,
      this.name,
      this.lat,
      this.lon,
      this.country,
      this.iso2,
      this.type,
      this.population});

  City.fromJson(Map<String, dynamic> json) {
    geonameId = json['geoname_id'];
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    iso2 = json['iso2'];
    type = json['type'];
    population = json['population'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geoname_id'] = this.geonameId;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['country'] = this.country;
    data['iso2'] = this.iso2;
    data['type'] = this.type;
    data['population'] = this.population;
    return data;
  }
}

class Lista {
  int dt;
  Temp temp;
  double pressure;
  int humidity;
  List<Weather> weather;
  double speed;
  int deg;
  double gust;
  int clouds;
  double snow;

  Lista(
      {this.dt,
      this.temp,
      this.pressure,
      this.humidity,
      this.weather,
      this.speed,
      this.deg,
      this.gust,
      this.clouds,
      this.snow});

  Lista.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = json['temp'] != null ? new Temp.fromJson(json['temp']) : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
    clouds = json['clouds'];
    snow = json['snow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    if (this.temp != null) {
      data['temp'] = this.temp.toJson();
    }
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    data['gust'] = this.gust;
    data['clouds'] = this.clouds;
    data['snow'] = this.snow;
    return data;
  }
}

class Temp {
  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}
