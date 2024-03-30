import 'package:flutter/cupertino.dart';

import 'common/helpers/x_helpers.dart';

// import 'firebase_options.dart';

class Global{
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //    options: DefaultFirebaseOptions.currentPlatform,
    // );
    storageService = await StorageService().init();
  }

}