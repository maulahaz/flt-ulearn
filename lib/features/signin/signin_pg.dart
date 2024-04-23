import 'package:flt_ulearn/common/configs/x_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/widgets/x_widgets.dart';
import 'x_signin.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            // appBar: buildAppbar(),
            appBar: MyAppBar('Signin'),
            backgroundColor: cWhite,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //top login buttons
                  thirdPartyLogin(),
                  //more login options message
                  Center(
                      child:MyText("Or use your email account to login")),
                  SizedBox(
                    height: 50.h,
                  ),
                  //email text box
                  appTextField(
                      text: "Email",
                      iconName: pathImgUser,
                      hintText: "Enter your email address"),
                  SizedBox(
                    height: 20.h,
                  ),
                  //password text box
                  appTextField(
                      text: "Password",
                      iconName: pathImgLock,
                      hintText: "Enter your password",
                      obscureText: true),
                  SizedBox(
                    height: 20.h,
                  ),
                  //forgot text
                  Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: MyText("Forgot password?", isUnderline: true)),
                  SizedBox(
                    height: 100.h,
                  ),
                  //app login button
                  Center(child: appButton(buttonName: "Login")),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: appButton(
                          buttonName: "Register",
                          isLogin: false,
                          context: context,
                          func: ()=>{
                            // return Navigator.pushNamed(context, "/register")
                            }
                            ))
                  //app register button
                ],
              ),
            )),
      ),
    );
  }
}
