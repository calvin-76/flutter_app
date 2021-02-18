import 'package:flutter/foundation.dart';

class PlayAudio {
  static void playAudio(String path) {
    if (kIsWeb) {
    } else {
      // not on the web so we must use a mobile/desktop library...
    }
  }
}
