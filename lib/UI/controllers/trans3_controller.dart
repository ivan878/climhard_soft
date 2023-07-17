import 'package:climhard_soft/UI/models/trans3.dart';

class TransController3 {
  static double calculResult3(Trans3 trans3) {
    return trans3.gV * trans3.sV * trans3.RmV * trans3.Ev;
  }
}
