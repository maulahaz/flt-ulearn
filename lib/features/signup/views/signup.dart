import 'package:flt_ulearning/common/utils/app_colors.dart';
import 'package:flt_ulearning/common/widgets/app_bar.dart';
import 'package:flt_ulearning/common/widgets/app_textfields.dart';
import 'package:flt_ulearning/common/widgets/button_widgets.dart';
import 'package:flt_ulearning/common/widgets/text_widgets.dart';
import 'package:flt_ulearning/features/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/global/global_loader.dart';
import '../../../common/utils/image_res.dart';
import '../providers/register_notifier.dart';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  late SignupController controller;

  @override
  void initState() {
    controller = SignupController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    //--LoaderProvider:
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppbar(title: 'Signup'),
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
                        SizedBox(
                          height: 30.h,
                        ),
                        //more login options message
                        Center(
                            child: Text14Normal(
                                text:
                                    "Enter your details below & free sign up")),
                        SizedBox(
                          height: 50.h,
                        ),
                        //user name text box
                        appTextField(
                          text: "User name",
                          iconName: ImageRes.user,
                          hintText: "Enter your user name",
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUserNameChange(value),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //email text box
                        appTextField(
                          text: "Email",
                          iconName: ImageRes.user,
                          hintText: "Enter your email address",
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUserEmailChange(value),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //password text box
                        appTextField(
                          text: "Password",
                          iconName: ImageRes.lock,
                          hintText: "Enter your password",
                          obscureText: true,
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUserPasswordChange(value),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //password text box
                        appTextField(
                            text: "Confirm your password",
                            iconName: ImageRes.lock,
                            hintText: "Confirm your password",
                            func: (value) => ref
                                .read(registerNotifierProvider.notifier)
                                .onUserRePasswordChange(value),
                            obscureText: true),
                        SizedBox(
                          height: 20.h,
                        ),
                        //forgot text
                        Container(
                            margin: EdgeInsets.only(left: 25.w),
                            child: const Text14Normal(
                                text:
                                    "By creating an account you are agreeing with our terms and conditions")),
                        SizedBox(
                          height: 100.h,
                        ),

                        Center(
                            child: appButton(
                                buttonName: "Register",
                                isLogin: true,
                                context: context,
                                func: () => controller.handleSignUp()))
                      ],
                    ),
                  )),
      ),
    );
  }
}
