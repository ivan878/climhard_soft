import 'package:climhard_soft/UI/controllers/trans_controller.dart';
import 'package:climhard_soft/UI/models/trans.dart';
import 'package:flutter/material.dart';

class DataProviderQ extends ChangeNotifier {
  double sommeTrans = 0.0;
  Trans transA = Trans();

  changeTransA(Trans trans) {
    transA = trans;
    getSommeDesCacules();
    notifyListeners();
  }

  Trans transB = Trans();

  changeTransB(Trans trans) {
    transB = trans;
    getSommeDesCacules();
    notifyListeners();
  }

  Trans transC = Trans();

  changeTransC(Trans trans) {
    transC = trans;
    getSommeDesCacules();
    notifyListeners();
  }

  Trans transD = Trans();

  changeTransD(Trans trans) {
    transD = trans;
    getSommeDesCacules();
    notifyListeners();
  }

  Trans transE = Trans();

  changeTransE(Trans trans) {
    transE = trans;
    getSommeDesCacules();
    notifyListeners();
  }

  Trans transF = Trans();

  changeTransF(Trans trans) {
    transF = trans;
    getSommeDesCacules();
    notifyListeners();
  }

  Trans transG = Trans();

  changeTransG(Trans trans) {
    transG = trans;
    getSommeDesCacules();
    notifyListeners();
  }

  Trans transH = Trans();

  changeTransH(Trans trans) {
    transH = trans;
    getSommeDesCacules();

    notifyListeners();
  }

  getSommeDesCacules() {
    final listTrans = [
      transA,
      transB,
      transC,
      transD,
      transE,
      transF,
      transG,
      transH
    ];
    var sommeR = 0.0;
    for (var element in listTrans) {
      sommeR += TransController.calculResult(element);
    }
    sommeTrans = sommeR;
    notifyListeners();
  }
}
