import 'package:transfiya_lib/data/repositories/transfiya_repository_adapter.dart';
import '../../domain/index.dart';
import 'data_source_injector.dart';

class RepositoryInjector {
  static RepositoryInjector? _singleton;

  factory RepositoryInjector() {
    _singleton ??= RepositoryInjector._();
    return _singleton!;
  }

  RepositoryInjector._();

  TransfiyaRepository provideTransfiyaRepository() {
    return TransfiyaRepositoryAdapter(
      DataSourceInjector().provideActivarUsuarioApiSource(),
      DataSourceInjector().provideConsultarTransaccionesApiSource(),
      DataSourceInjector().provideConsultarNumerosApiSource(),
    );
  }
}
