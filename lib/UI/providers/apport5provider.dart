import 'package:flutter/material.dart';

import '../controllers/trans5_controller.dart';
import '../models/trans5.dart';

class Apport5Provider extends ChangeNotifier{
      double sommeApport5 = 0;

  Trans5 trans5A = Trans5();

 setTrans(Trans5 trans ){
    trans5A = trans;
    getSommeTrans5();
    notifyListeners();
  }
 
  getSommeTrans5(){
    final list = [trans5A];
      sommeApport5 = 0.0;
    for (var element in list) { 
      sommeApport5+= TransController5.calculResult5(element);
    }
    notifyListeners();
   }
}