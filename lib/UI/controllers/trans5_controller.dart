import 'package:climhard_soft/UI/models/trans5.dart';

const constante = 0.84;

class TransController5 {
  static double calculResult5(Trans5 trans5) {
    return (trans5.We - trans5.Wi) * trans5.Qv * constante;
  }
}
