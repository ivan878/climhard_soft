import 'package:flutter/material.dart';

import '../controllers/trans7_controller.dart';
import '../models/trans7.dart';

class Apport7Provider extends ChangeNotifier{
  double sommeApport7 = 0;

  Trans7 trans7A = Trans7();

 setTransA(Trans7 trans ){
    trans7A = trans;
    getSommeTrans7();
    notifyListeners();
  }
 
  getSommeTrans7(){
    final list = [trans7A];
      sommeApport7 = 0.0;
    for (var element in list) { 
      sommeApport7+= TransController7.calculResult7(element);
    }
    notifyListeners();
   }
}