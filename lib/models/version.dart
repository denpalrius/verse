class Version {
  final String code;
  final String name;

  Version.fromJsonMap(Map map)
      : code = map['code'],
        name = map['name'];
}
