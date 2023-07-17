import 'package:climhard_soft/UI/models/trans7.dart';

class TransController7 {
  static double calculResult7(Trans7 trans7) {
    return trans7.N * trans7.Cocc * (trans7.Cs + trans7.Cl);
  }
}
