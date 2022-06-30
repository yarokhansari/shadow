import 'package:flutter/material.dart';

Widget loadingWidget() {
  return Center(
    child: Image.asset(
      'assets/images/loading.gif',
      fit: BoxFit.fitHeight,
      height: 80,
      width: 80,
    ),
  );
}
