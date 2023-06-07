import 'package:transfiya_lib/domain/repositories/transfiya_repository.dart';

import '../entities/index.dart';

class ActivarUsuarioUseCase {
  ActivarUsuarioUseCase(this._transfiyaRepository);

  final TransfiyaRepository _transfiyaRepository;

  Future<bool?> call(ParametrosActivarUsuario params) async {
    return await _transfiyaRepository.activarUsuario(params);
  }
}
