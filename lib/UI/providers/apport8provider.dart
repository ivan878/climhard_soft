import 'package:climhard_soft/UI/controllers/trans8_controller.dart';
import 'package:climhard_soft/UI/models/trans8.dart';
import 'package:flutter/material.dart';

class Apport8Provider extends ChangeNotifier {
  double sommeApport8 = 0;

  Trans8 trans8A = Trans8();
  Trans8 trans8B = Trans8();

  setTransA(Trans8 trans) {
    trans8A = trans;
    getSommeTrans8();
    notifyListeners();
  }

  setTransB(Trans8 trans8B) {
    trans8B = trans8B;
    getSommeTrans8();
    notifyListeners();
  }

  getSommeTrans8() {
    final list = [trans8A, trans8B];
    sommeApport8 = 0.0;
    for (var element in list) {
      sommeApport8 += TransController8.calculResult8(element);
    }
    notifyListeners();
  }
}
