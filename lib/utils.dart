import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}

Widget spacerheight(data) => SizedBox(
      height: double.parse(data.toString()),
    );
TextStyle styletitle =
    const TextStyle(fontSize: 18, fontWeight: FontWeight.w800);
TextStyle police = const TextStyle(fontSize: 15, fontWeight: FontWeight.w600);

printer(data) {
  if (kDebugMode) {
    print(data);
  }
}

const String database = "projet_db";
