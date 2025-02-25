import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          children: [
            HighlightView(
              '''main() {
                print("Hello, World!");
              }
              ''',
              language: 'json',
              padding: EdgeInsets.all(12),
              textStyle: TextStyle(
                fontFamily: 'My awesome monospace font',
                fontSize: 16,
              ),
            ),
            FloatingActionButton(
              onPressed: null,
              tooltip: 'Print',
              child: const Icon(Icons.print_sharp),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Print',
        child: const Icon(Icons.print),
      ),
    );
  }
}
