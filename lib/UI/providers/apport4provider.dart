import 'package:flutter/material.dart';

import '../controllers/trans4_controller.dart';
import '../models/trans4.dart';

class Apport4Provider extends ChangeNotifier{
    double sommeApport4 = 0;

  Trans4 trans4A = Trans4();

 setTransA(Trans4 trans ){
    trans4A = trans;
    getSommeTrans4();
    notifyListeners();
  }
 
  getSommeTrans4(){
    final list = [trans4A];
      sommeApport4 = 0.0;
    for (var element in list) { 
      sommeApport4+= TransController4.calculResult4(element);
    }
    notifyListeners();
   }
}