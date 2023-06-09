import 'package:transfiya_lib/presentation/di/repository_injector.dart';

import '../../domain/index.dart';

class Injector {
  static Injector? _singleton;

  factory Injector() {
    _singleton ??= Injector._();
    return _singleton!;
  }

  Injector._();

  ActivarUsuarioUseCase provideActivarUsuarioUseCase() {
    return ActivarUsuarioUseCase(
        RepositoryInjector().provideTransfiyaRepository());
  }

  ConsultarTransaccionesUseCase provideConsultarTransaccionesUseCase() {
    return ConsultarTransaccionesUseCase(
        RepositoryInjector().provideTransfiyaRepository());
  }
}
