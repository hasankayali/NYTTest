import 'package:flutter/foundation.dart';

@immutable
abstract class NewsEvents {}

class GetNewsEvent extends NewsEvents {
  final int period;
  GetNewsEvent(this.period);
}
