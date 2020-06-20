import 'package:connectivity/connectivity.dart';

/*
  This helper function uses the connectivty package to check
  the current connection status of the device.

  If internet connection is available, it will return true boolean result.
  If not, it will return a false boolean instead.
*/

Future<bool> isConnected() async {
  var _connectionResult = await (Connectivity().checkConnectivity());

  if (_connectionResult == ConnectivityResult.mobile ||
      _connectionResult == ConnectivityResult.wifi) {
    return Future.value(true);
  }

  return Future.value(false);
}
