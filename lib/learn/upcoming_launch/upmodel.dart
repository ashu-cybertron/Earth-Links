class Launch {
  final DateTime launchUTC;
  final Rockett rocket;

  Launch({this.launchUTC, this.rocket});

  Launch.fromJson(Map<dynamic, dynamic> parsedJson)
      : launchUTC = DateTime.parse(parsedJson['launch_date_utc']),
        rocket = Rockett.fromJson(parsedJson['rocket']);
}

class Rockett {
  final String rocketName;

  Rockett({this.rocketName});

  Rockett.fromJson(Map<dynamic, dynamic> parsedJson)
      : rocketName = parsedJson['rocket_name'];
}
