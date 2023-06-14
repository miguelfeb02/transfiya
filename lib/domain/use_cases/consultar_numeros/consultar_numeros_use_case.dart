import 'package:transfiya_lib/domain/repositories/transfiya_repository.dart';

import '../../entities/index.dart';

class ConsultarNumerosUseCase {
  ConsultarNumerosUseCase(this._transfiyaRepository);

  final TransfiyaRepository _transfiyaRepository;

  Future<RespuestaConsultarNumeros?> call() async {
    return await _transfiyaRepository.consultarNumeros();
  }
}
