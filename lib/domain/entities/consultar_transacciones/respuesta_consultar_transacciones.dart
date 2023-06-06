import 'dart:convert';

class RespuestaCosultarTransacciones {
  List<Transacciones> transacciones;
  bool usuarioActivo;

  RespuestaCosultarTransacciones({
    required this.transacciones,
    required this.usuarioActivo,
  });

  factory RespuestaCosultarTransacciones.fromRawJson(String str) =>
      RespuestaCosultarTransacciones.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RespuestaCosultarTransacciones.fromJson(Map<String, dynamic> json) =>
      RespuestaCosultarTransacciones(
        transacciones: List<Transacciones>.from(
            json["transacciones"].map((x) => Transacciones.fromJson(x))),
        usuarioActivo: json["usuarioActivo"],
      );

  Map<String, dynamic> toJson() => {
        "transacciones":
            List<dynamic>.from(transacciones.map((x) => x.toJson())),
        "usuarioActivo": usuarioActivo,
      };
}

class Transacciones {
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

  Transacciones({
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

  factory Transacciones.fromRawJson(String str) =>
      Transacciones.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Transacciones.fromJson(Map<String, dynamic> json) => Transacciones(
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
