import 'package:climhard_soft/UI/models/trans4.dart';

const constante = 0.33;

class TransController4 {
  static double calculResult4(Trans4 trans4) {
    return (trans4.Oe - trans4.Oi) * trans4.Qv * constante;
  }
}
