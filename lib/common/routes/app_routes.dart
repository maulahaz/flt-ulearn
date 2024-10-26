import 'package:flt_ulearning/common/models/x_entities.dart';
import 'package:flt_ulearning/features/application/views/application.dart';
import 'package:flt_ulearning/features/signin/views/signin.dart';
import 'package:flt_ulearning/features/welcome/views/welcome.dart';
import 'package:flutter/material.dart';

import '../../features/home/views/home.dart';
import '../../global.dart';
import '../../features/signup/views/signup.dart';

class AppPages {
  static const INITIAL = '/init';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
  static const WELCOME = '/';
  static const APPLICATION = '/application';
  static const HOME = '/home';

  static List<RouteEntity> appRoutes() {
    return [
      RouteEntity(path: AppPages.WELCOME, page: Welcome()),
      RouteEntity(path: AppPages.SIGNIN, page: Signin()),
      RouteEntity(path: AppPages.SIGNUP, page: Signup()),
      RouteEntity(path: AppPages.APPLICATION, page: Application()),
      RouteEntity(path: AppPages.HOME, page: Home()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    (kDebugMode) => print('Clicked route is ${settings.name}');

    if (settings.name != null) {
      var result =
          appRoutes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        //--Check if it is first time run:
        bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
        //
        if (result.first.path == AppPages.WELCOME && deviceFirstTime) {
          //--Check if user is logged in:
          bool isLoggedIn = Global.storageService.isLoggedIn();
          if (isLoggedIn) {
            //--User is logged in (Go to Application Page):
            return MaterialPageRoute(
              builder: (_) => const Application(),
              settings: settings,
            );
          } else {
            //--User is NOT-YET logged in (Go to Signin Page):
            return MaterialPageRoute(
              builder: (_) => const Signin(),
              settings: settings,
            );
          }
        } else {
          //--App run first time:
          (kDebugMode) => print('App run first time');

          return MaterialPageRoute(
            builder: (_) => result.first.page,
            settings: settings,
          );
        }
      }
    }
    print('Settings.name is 2');
    //--If setting not found anything, then go to onboarding page:
    return MaterialPageRoute(
      builder: (_) => Welcome(),
      settings: settings,
    );
  }
}
