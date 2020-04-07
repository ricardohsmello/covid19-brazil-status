import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('REQUEST');

    print('URL ${data.url}');
    print('HEADERS ${data.headers}');
    print('BODY ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('RESPONSE');

    print('HEADERS ${data.headers}');
    print('Status Code ${data.statusCode}');
    print('BODY ${data.body}');
    return data;
  }
}