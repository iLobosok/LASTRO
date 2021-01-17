import 'dart:io';

class AdManager {

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4978601060133496~9338235137";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4978601060133496/9590157209";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
