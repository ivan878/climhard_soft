import 'package:climhard_soft/UI/controllers/trans2_controller.dart';
import 'package:climhard_soft/UI/models/trans2.dart';
import 'package:flutter/material.dart';

class Apport2Provider extends ChangeNotifier {
  double sommeApport2 = 0.0;

  Trans2 trans2A = Trans2();
  Trans2 trans2B = Trans2();
  Trans2 trans2C = Trans2();
  Trans2 trans2D = Trans2();
  // Trans2 trans2A = Trans2();

  setTransA(Trans2 trans) {
    trans2A = trans;
    getSommeTrans2();
    notifyListeners();
  }

  setTransB(Trans2 trans) {
    trans2B = trans;
    getSommeTrans2();
    notifyListeners();
  }

  setTransC(Trans2 trans) {
    trans2C = trans;
    getSommeTrans2();
    notifyListeners();
  }

  setTransD(Trans2 trans) {
    trans2D = trans;
    getSommeTrans2();
    notifyListeners();
  }

  getSommeTrans2() {
    final list = [trans2A, trans2B, trans2D, trans2C];
    sommeApport2 = 0.0;
    for (var element in list) {
      sommeApport2 += TransController2.calculResult2(element);
    }
    notifyListeners();
  }
}
