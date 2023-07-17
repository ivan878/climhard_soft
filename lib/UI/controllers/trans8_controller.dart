import 'package:climhard_soft/UI/models/trans8.dart';

class TransController8 {
  static double calculResult8(Trans8 trans8) {
    return trans8.No * trans8.Cu * (trans8.Cs + trans8.Cl);
  }
}
