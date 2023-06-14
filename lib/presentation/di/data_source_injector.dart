import '../../data/index.dart';
import '../index.dart';
import 'package:http/http.dart' as http;

class DataSourceInjector {
  static DataSourceInjector? _singleton;
  factory DataSourceInjector() {
    _singleton ??= DataSourceInjector._();
    return _singleton!;
  }

  DataSourceInjector._();

  ActivarUsuarioApiSource provideActivarUsuarioApiSource() {
    return ActivarUsuarioApiSourceAdapter(
      MySingleton().baseUrl ?? "",
      MySingleton().uuid ?? "",
      http.Client(),
      MyConnectivityImpl(),
      MySingleton(),
    );
  }

  ConsultarTransaccionesApiSource provideConsultarTransaccionesApiSource() {
    return ConsultarTransaccionesApiSourceAdapter(
      MySingleton().baseUrl ?? "",
      MySingleton().uuid ?? "",
      http.Client(),
      MyConnectivityImpl(),
      MySingleton(),
    );
  }

  ConsultarNumerosApiSource provideConsultarNumerosApiSource() {
    return ConsultarNumerosApiSourceAdapter(
      MySingleton().baseUrl ?? "",
      MySingleton().uuid ?? "",
      http.Client(),
      MyConnectivityImpl(),
      MySingleton(),
    );
  }
}
