import 'package:flutter/foundation.dart';

void printW(text) {
  if (kDebugMode) {
    print('\x1B[33m$text\x1B[0m');
  }
}

void printE(text) {
  if (kDebugMode) {
    print('\x1B[31m$text\x1B[0m');
  }
}

void printO(text) {
  if (kDebugMode) {
    print('\x1b[32m$text\x1B[0m');
  }
}

void limparPrint() {
  if (kDebugMode) {
    print("\x1B[2J\x1B[0;0H");
  }
}
