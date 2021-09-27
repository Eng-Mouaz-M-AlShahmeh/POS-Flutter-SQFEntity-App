// Eng Mouaz M. Al-Shahmeh
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

Future<File> qrImage(BuildContext context, String text) async {
  final qrValidationResult = QrValidator.validate(
    data: text,
    version: QrVersions.auto,
    errorCorrectionLevel: QrErrorCorrectLevel.L,
  );
  final QrCode qrCode = qrValidationResult.qrCode!;
  final painter = QrPainter.withQr(
    qr: qrCode,
    color: const Color(0xFF000000),
    gapless: true,
    embeddedImageStyle: null,
    embeddedImage: null,
  );
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  final ts = DateTime.now().millisecondsSinceEpoch.toString();
  String path = '$tempPath/$ts.png';
  Future<void> writeToFile(ByteData data, String path) async {
    final buffer = data.buffer;
    await File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }
  final picData = await painter.toImageData(480, format: ImageByteFormat.png);
  await writeToFile(picData!, path);
  return File(path);
}
