import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'autentication.dart';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [AutenticacaoInterceptor()],
  requestTimeout: Duration(seconds: 5),
);
