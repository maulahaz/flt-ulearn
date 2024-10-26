import 'package:flt_ulearning/common/widgets/app_bar.dart';
import 'package:flt_ulearning/common/widgets/app_textfields.dart';
import 'package:flt_ulearning/common/widgets/button_widgets.dart';
import 'package:flt_ulearning/common/widgets/text_widgets.dart';
import 'package:flt_ulearning/features/signin/controllers/signin_controller.dart';
import 'package:flt_ulearning/features/signin/views/widgets/signin_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/global/global_loader.dart';
import '../../../common/utils/app_colors.dart';
import '../../../common/utils/image_res.dart';
import '../providers/signin_notifier.dart';

class Signin extends ConsumerStatefulWidget {
  const Signin({super.key});

  @override
  ConsumerState<Signin> createState() => _SigninState();
}

class _SigninState extends ConsumerState<Signin> {
  late SigninController controller;

  @override
  void initState() {
    controller = SigninController(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signinProvider = ref.watch(signinNotifierProvider);
    //--LoaderProvider:
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppbar(title: 'Signin'),
            backgroundColor: Colors.white,
            body: loader == true
                ? Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                        color: AppColors.primaryElement))
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //top login buttons
                        thirdPartyLogin(),
                        //more login options message
                        Center(
                            child: Text14Normal(
                                text: "Or use your email account to login")),
                        SizedBox(
                          height: 50.h,
                        ),
                        //email text box
                        appTextField(
                          controller: controller.emailController,
                          text: "Email",
                          iconName: ImageRes.user,
                          hintText: "Enter your email address",
                          func: (value) => ref
                              .read(signinNotifierProvider.notifier)
                              .onUserEmailChange(value),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //password text box
                        appTextField(
                          controller: controller.passwordController,
                          text: "Password",
                          iconName: ImageRes.lock,
                          hintText: "Enter your password",
                          obscureText: true,
                          func: (value) => ref
                              .read(signinNotifierProvider.notifier)
                              .onUserPasswordChange(value),
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        //app login button
                        Center(
                            child: appButton(
                                buttonName: "Signin",
                                func: () {
                                  controller.handleSignin();
                                })),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                            child: appButton(
                                buttonName: "Signup",
                                isLogin: false,
                                context: context,
                                func: () =>
                                    Navigator.pushNamed(context, "/signup")))
                      ],
                    ),
                  )),
      ),
    );
  }
}
