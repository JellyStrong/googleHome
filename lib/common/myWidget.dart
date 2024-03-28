import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget myBackButton(BuildContext context, String router, Color color) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.all(17.0),
      child: InkWell(
        onTap: () {
          context.go(router);
        },
        child: Icon(
          Icons.arrow_back,
          color: color,
        ),
      ),
    ),
  );
}
