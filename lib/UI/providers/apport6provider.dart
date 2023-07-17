
import 'package:flutter/material.dart';

import '../controllers/trans6_controller.dart';
import '../models/trans6.dart';

class Apport6Provider extends ChangeNotifier{
      double sommeApport6 = 0;

  Trans6 trans6A = Trans6();

 setTransA(Trans6 trans ){
    trans6A = trans;
    getSommeTrans6();
    notifyListeners();
  }
 
  getSommeTrans6(){
    final list = [trans6A];
      sommeApport6 = 0.0;
    for (var element in list) { 
      sommeApport6+= TransController6.calculResult6(element);
    }
    notifyListeners();
   }
}