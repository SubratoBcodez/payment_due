import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class SimpleModal {
  static Future<void> show(BuildContext context) async {
    try {
      final req = await HttpClient().getUrl(Uri.parse(
          'https://raw.githubusercontent.com/SubratoBcodez/payment_due/master/modal.json?t=${DateTime.now().millisecondsSinceEpoch}'));
      final res = await req.close();
      debugPrint('SimpleModal status: ${res.statusCode}');
      final data = jsonDecode(await utf8.decodeStream(res));
      if (data['show'] != true || !context.mounted) return;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(content: Text(data['text'])),
      );
    } catch (e) {
      debugPrint('SimpleModal error: $e');
    }
  }
}