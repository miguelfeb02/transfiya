import 'package:transfiya_lib/domain/repositories/transfiya_repository.dart';

import '../entities/index.dart';

class ConsultarTransaccionesUseCase {
  ConsultarTransaccionesUseCase(this._transfiyaRepository);

  final TransfiyaRepository _transfiyaRepository;

  Future<RespuestaCosultarTransacciones?> call(
      ParametrosConsultarTransacciones params) async {
    return await _transfiyaRepository.consultarTransacciones(params);
  }
}
