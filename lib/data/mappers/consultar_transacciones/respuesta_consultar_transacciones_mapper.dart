import 'package:transfiya_lib/data/models/remote/index.dart';
import 'package:transfiya_lib/domain/entities/index.dart';

class RespuestaConsultarTransaccionesMapper {
  static RespuestaConsultarTransacciones fromRemoteModel(
      RespuestaConsultarTransaccionesRemoteModel
          respuestaConsultarTransaccionesRemoteModel) {
    RespuestaConsultarTransacciones respuestaConsultarTransacciones =
        RespuestaConsultarTransacciones(
            usuarioActivo:
                respuestaConsultarTransaccionesRemoteModel.usuarioActivo,
            transacciones: List<Transacciones>.from(
                respuestaConsultarTransaccionesRemoteModel.transacciones
                    .map((x) => TransaccionesMapper.fromRemoteModel(x))));

    return respuestaConsultarTransacciones;
  }

  static RespuestaConsultarTransaccionesRemoteModel fromEntity(
      RespuestaConsultarTransacciones respuestaConsultarTransacciones) {
    RespuestaConsultarTransaccionesRemoteModel
        respuestaConsultarTransaccionesRemoteModel =
        RespuestaConsultarTransaccionesRemoteModel(
            usuarioActivo: respuestaConsultarTransacciones.usuarioActivo,
            transacciones: List<TransaccionesRemoteModel>.from(
                respuestaConsultarTransacciones.transacciones
                    .map((x) => TransaccionesMapper.fromEntity(x))));

    return respuestaConsultarTransaccionesRemoteModel;
  }
}

class TransaccionesMapper {
  static Transacciones fromRemoteModel(
      TransaccionesRemoteModel transaccionesRemoteModel) {
    Transacciones transacciones = Transacciones(
        transferId: transaccionesRemoteModel.transferId,
        txId: transaccionesRemoteModel.txId,
        txRef: transaccionesRemoteModel.txRef,
        source: transaccionesRemoteModel.source,
        sourceWallet: transaccionesRemoteModel.sourceWallet,
        sourceSigner: transaccionesRemoteModel.sourceSigner,
        sourceSignerBalance: transaccionesRemoteModel.sourceSignerBalance,
        sourceBank: transaccionesRemoteModel.sourceBank,
        sourceBankBicfi: transaccionesRemoteModel.sourceBankBicfi,
        target: transaccionesRemoteModel.target,
        targetWallet: transaccionesRemoteModel.targetWallet,
        targetSigner: transaccionesRemoteModel.targetSigner,
        targetSignerBalance: transaccionesRemoteModel.sourceSignerBalance,
        targetBank: transaccionesRemoteModel.targetBank,
        targetBankBicfi: transaccionesRemoteModel.targetBankBicfi,
        amount: transaccionesRemoteModel.amount,
        symbol: transaccionesRemoteModel.symbol,
        type: transaccionesRemoteModel.type,
        status: transaccionesRemoteModel.status,
        description: transaccionesRemoteModel.description);
    return transacciones;
  }

  static TransaccionesRemoteModel fromEntity(Transacciones transacciones) {
    TransaccionesRemoteModel transaccionesRemoteModel =
        TransaccionesRemoteModel(
            transferId: transacciones.transferId,
            txId: transacciones.txId,
            txRef: transacciones.txRef,
            source: transacciones.source,
            sourceWallet: transacciones.sourceWallet,
            sourceSigner: transacciones.sourceSigner,
            sourceSignerBalance: transacciones.sourceSignerBalance,
            sourceBank: transacciones.sourceBank,
            sourceBankBicfi: transacciones.sourceBankBicfi,
            target: transacciones.target,
            targetWallet: transacciones.targetWallet,
            targetSigner: transacciones.targetSigner,
            targetSignerBalance: transacciones.sourceSignerBalance,
            targetBank: transacciones.targetBank,
            targetBankBicfi: transacciones.targetBankBicfi,
            amount: transacciones.amount,
            symbol: transacciones.symbol,
            type: transacciones.type,
            status: transacciones.status,
            description: transacciones.description);
    return transaccionesRemoteModel;
  }
}
