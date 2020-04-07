import 'dart:convert';
import 'package:covid19_brazil_status/models/Statistics.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

import 'interceptors/interceptor.dart';

class WebClient {
  static const String baseURL =
      "https://covid19-brazil-api.now.sh/api/report/v1/brazil";

  var httpClientWithInterceptor =
      HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);

  Future<Statistics> fetchAllStatistics() async {
    Response response = await httpClientWithInterceptor
        .get(baseURL)
        .timeout(Duration(seconds: 15));

     return Statistics.fromJson(jsonDecode(response.body));
   }
}
