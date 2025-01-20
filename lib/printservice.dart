// import 'package:esc_pos_printer/esc_pos_printer.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:play_ground/fn.dart';

// class PrintService {
//   final String printerIp; // IP da impressora Zebra
//   final int port; // Porta (geralmente 9100)

//   PrintService({required this.printerIp, this.port = 9100});

//   Future<void> printSample() async {
//     // Configure o perfil da impressora
//     final profile = await CapabilityProfile.load();

//     // Crie uma instância da impressora
//     final printer = NetworkPrinter(PaperSize.mm80, profile);

//     // Tente se conectar à impressora
//     final PosPrintResult res = await printer.connect(
//       printerIp,
//       port: port,
//       timeout: Duration(seconds: 30),
//     );
//     printO(res.msg);

//     if (res == PosPrintResult.success) {
//       printW('Conexão bem-sucedida');
//       // Comece a impressão
//       printer.text('Exemplo de Impressão', styles: PosStyles(align: PosAlign.center, bold: true));
//       printer.text('------------------------');

//       // Adicione mais conteúdo
//       printer.text('TESTE DO SETOR TI');
//       printer.text('TESTE DO SETOR TI');
//       printer.text('TESTE DO SETOR TI', styles: PosStyles(align: PosAlign.right, bold: true));

//       printer.feed(2); // Alimenta o papel
//       printer.cut(); // Corta o papel

//       // Finaliza a conexão
//       printer.disconnect();
//     } else {
//       printE('Erro de conexão: ${res.msg}');
//     }
//   }
// }
