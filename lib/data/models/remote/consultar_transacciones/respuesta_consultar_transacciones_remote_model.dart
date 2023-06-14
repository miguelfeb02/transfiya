import 'dart:convert';

class RespuestaConsultarTransaccionesRemoteModel {
  List<TransaccionesRemoteModel> transacciones;
  bool usuarioActivo;

  RespuestaConsultarTransaccionesRemoteModel({
    required this.transacciones,
    required this.usuarioActivo,
  });

  factory RespuestaConsultarTransaccionesRemoteModel.fromRawJson(String str) =>
      RespuestaConsultarTransaccionesRemoteModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RespuestaConsultarTransaccionesRemoteModel.fromJson(
          Map<String, dynamic> json) =>
      RespuestaConsultarTransaccionesRemoteModel(
        transacciones: List<TransaccionesRemoteModel>.from(json["transacciones"]
            .map((x) => TransaccionesRemoteModel.fromJson(x))),
        usuarioActivo: json["usuarioActivo"],
      );

  Map<String, dynamic> toJson() => {
        "transacciones":
            List<dynamic>.from(transacciones.map((x) => x.toJson())),
        "usuarioActivo": usuarioActivo,
      };
}

class TransaccionesRemoteModel {
  String transferId;
  dynamic txId;
  String txRef;
  String source;
  String sourceWallet;
  dynamic sourceSigner;
  dynamic sourceSignerBalance;
  dynamic sourceBank;
  dynamic sourceBankBicfi;
  String target;
  String targetWallet;
  String targetSigner;
  dynamic targetSignerBalance;
  dynamic targetBank;
  dynamic targetBankBicfi;
  String amount;
  String symbol;
  String type;
  String status;
  String description;

  TransaccionesRemoteModel({
    required this.transferId,
    required this.txId,
    required this.txRef,
    required this.source,
    required this.sourceWallet,
    required this.sourceSigner,
    required this.sourceSignerBalance,
    required this.sourceBank,
    required this.sourceBankBicfi,
    required this.target,
    required this.targetWallet,
    required this.targetSigner,
    required this.targetSignerBalance,
    required this.targetBank,
    required this.targetBankBicfi,
    required this.amount,
    required this.symbol,
    required this.type,
    required this.status,
    required this.description,
  });

  factory TransaccionesRemoteModel.fromRawJson(String str) =>
      TransaccionesRemoteModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransaccionesRemoteModel.fromJson(Map<String, dynamic> json) =>
      TransaccionesRemoteModel(
        transferId: json["transferId"],
        txId: json["txId"],
        txRef: json["txRef"],
        source: json["source"],
        sourceWallet: json["sourceWallet"],
        sourceSigner: json["sourceSigner"],
        sourceSignerBalance: json["sourceSignerBalance"],
        sourceBank: json["sourceBank"],
        sourceBankBicfi: json["sourceBankBicfi"],
        target: json["target"],
        targetWallet: json["targetWallet"],
        targetSigner: json["targetSigner"],
        targetSignerBalance: json["targetSignerBalance"],
        targetBank: json["targetBank"],
        targetBankBicfi: json["targetBankBicfi"],
        amount: json["amount"],
        symbol: json["symbol"],
        type: json["type"],
        status: json["status"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "transferId": transferId,
        "txId": txId,
        "txRef": txRef,
        "source": source,
        "sourceWallet": sourceWallet,
        "sourceSigner": sourceSigner,
        "sourceSignerBalance": sourceSignerBalance,
        "sourceBank": sourceBank,
        "sourceBankBicfi": sourceBankBicfi,
        "target": target,
        "targetWallet": targetWallet,
        "targetSigner": targetSigner,
        "targetSignerBalance": targetSignerBalance,
        "targetBank": targetBank,
        "targetBankBicfi": targetBankBicfi,
        "amount": amount,
        "symbol": symbol,
        "type": type,
        "status": status,
        "description": description,
      };
}
