import 'package:flutter/material.dart';

Future replacePage(BuildContext context, Widget page) async {
  return await Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (_) => page));
}

Future pushPage(BuildContext context, Widget page) async {
  return await Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}
