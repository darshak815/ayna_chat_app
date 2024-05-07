class RoutingData {
  String route;
  final Map<String, String> _queryParameters;

  RoutingData(
      {required this.route, required Map<String, String> queryParameters})
      : _queryParameters = queryParameters;

  operator [](String key) => _queryParameters[key];

  Map<String, String> get queryParameters => _queryParameters;
}
