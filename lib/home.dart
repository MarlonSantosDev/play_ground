import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:play_ground/fn.dart';
import 'package:smb_connect/smb_connect.dart';
import 'package:zsdk/zsdk.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final zsdk = ZSDK();
  final ip = "10.0.120.57";
  final ipFull1 = "\\10.0.120.57\\ZDesigner ZD220-203dpi ZPL";
  final ipFull2 = "10.0.120.57/ZDesigner ZD220-203dpi ZPL";

  fnZebraPrinter() async {
    /*
    try {
      printW("Inicio fnZebraPrinter");

      final connect = await SmbConnect.connectAuth(
        host: ip,
        domain: 'domain.com.br',
        //share: 'ZDesigner ZD220-203dpi ZPL',
        username: 'user', // Se necessário
        password: 'password,', // Se necessário
      );

      var shares = await connect.listShares();
      print(shares.map((e) => e.path).join(","));

      final zplCommand = '^XA^FO50,50^ADN,36,20^FDTeste de Impressão Zebra^FS^XZ'; // Comando ZPL

      // Nome do arquivo na impressora (normalmente vazio ou com caminho básico)
      final remoteFilePath = r'\\10.0.120.57\ZDesigner ZD220-203dpi ZPL'; // Caminho SMB correto

      // Cria o arquivo na impressora e abre um IOSink para escrita
      final smbFile = await connect.createFile(remoteFilePath);
      final writer = await connect.openWrite(smbFile);

      // Escreve o conteúdo ZPL no arquivo
      writer.add(utf8.encode(zplCommand));
      await writer.flush();
      await writer.close();

      // Fecha a conexão SMB
      await connect.close();
    } catch (e) {
      printE("Erro ao imprimir: $e");
    } finally {
      printW("Fim fnZebraPrinter");
    }
    */

    /* Soluaçao 1
    try {
      printW("Inicio fnZebraPrinter");
      final doc = pw.Document();

      doc.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Text('Hello World'),
            ); // Center
          },
        ),
      );
      await Printing.directPrintPdf(
        onLayout: (PdfPageFormat format) async => doc.save(),
        name: "Nome",
        printer: Printer(url: '\\10.0.120.57\\Designer ZD220-203dpi ZPL', name: "printer"),
      );
    } on Exception catch (e) {
      printE("Error: $e");
    } finally {
      printW("Fim fnZebraPrinter");
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () => fnZebraPrinter(),
              tooltip: 'Print',
              child: const Icon(Icons.print_sharp),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => fnZebraPrinter(),
        tooltip: 'Print',
        child: const Icon(Icons.print),
      ),
    );
  }
}
