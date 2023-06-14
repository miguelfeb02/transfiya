import 'package:transfiya_lib/data/index.dart';
import 'package:transfiya_lib/domain/index.dart';

mixin ActivarUsuarioApiSource {
  Future<Resultado<bool?>> activarUsuario(
      ParametrosActivarUsuarioRemoteModel params);
}
