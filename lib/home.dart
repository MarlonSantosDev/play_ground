import 'package:flutter/material.dart';
import 'package:play_ground/fn.dart';
import 'package:zebrautility/ZebraPrinter.dart';
import 'package:zebrautility/zebrautility.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  fnZebraPrinter() async {
    printO("fnZebraPrinter");
    ZebraPrinter zebraPrinter = await Zebrautility.getPrinterInstance(
      onPrinterFound: (name, ipAddress, isWifi) {
        printW("PrinterFound :$name$ipAddress$isWifi");
        return true;
      },
      onPrinterDiscoveryDone: () {
        printW("Discovery Done");
      },
      onChangePrinterStatus: (status, color) {
        printW("change printer status: $status$color");
      },
      onPermissionDenied: () {
        printW("Permission Deny.");
      },
    );
    zebraPrinter.connectToPrinter("192.168.47.50");
    zebraPrinter.setDarkness(25);
    zebraPrinter.print("Your ZPL");
    zebraPrinter.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => fnZebraPrinter(),
        tooltip: 'Increment',
        child: const Icon(Icons.print),
      ),
    );
  }
}
