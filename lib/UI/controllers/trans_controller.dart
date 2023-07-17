import 'package:climhard_soft/UI/models/trans.dart';

class TransController {
  static double calculResult(Trans trans) {
    return (trans.oe - trans.oi) * trans.l * trans.k * trans.h;
  }
}
