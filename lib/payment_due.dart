import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class SimpleModal {
  static Future<void> show(BuildContext context) async {
    try {
      final req = await HttpClient().getUrl(Uri.parse(
          'https://raw.githubusercontent.com/SubratoBcodez/payment_due/master/modal.json'));
      final data = jsonDecode(await utf8.decodeStream(await req.close()));
      if (data['show'] != true || !context.mounted) return;
      showDialog(context: context, builder: (_) => AlertDialog(content: Text(data['text'])));
    } catch (_) {}
  }
}