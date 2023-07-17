import 'package:climhard_soft/UI/models/trans3.dart';
import 'package:flutter/material.dart';

import '../controllers/trans3_controller.dart';

class Apport3Provider extends ChangeNotifier {
  double sommeApport3 = 0;

  Trans3 trans3A = Trans3();
  Trans3 trans3B = Trans3();
  Trans3 trans3C = Trans3();
  Trans3 trans3D = Trans3();
// Trans3 trans3A = Trans3();

  setTransA(Trans3 trans) {
    trans3A = trans;
    getSommeTrans3();
    notifyListeners();
  }

  setTransB(Trans3 trans) {
    trans3B = trans;
    getSommeTrans3();
    notifyListeners();
  }

  setTransC(Trans3 trans) {
    trans3C = trans;
    getSommeTrans3();
    notifyListeners();
  }

  setTransD(Trans3 trans) {
    trans3D = trans;
    getSommeTrans3();
    notifyListeners();
  }

  getSommeTrans3() {
    final list = [trans3A, trans3B, trans3D, trans3C];
    sommeApport3 = 0.0;
    for (var element in list) {
      sommeApport3 += TransController3.calculResult3(element);
    }
    notifyListeners();
  }
}
