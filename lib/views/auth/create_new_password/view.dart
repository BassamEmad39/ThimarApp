import 'package:flutter/material.dart';
import 'package:untitled3/core/design/app_button.dart';
import 'package:untitled3/core/design/app_input.dart';

import '../login/view.dart';

class CreateNewPasswordView extends StatefulWidget {
  const CreateNewPasswordView({super.key});

  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordViewState();
}

class _CreateNewPasswordViewState extends State<CreateNewPasswordView> {
  bool isHidden = true;
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/splash_bg.png",
            height: double.infinity,
            width: double.infinity,
            color: Color(0xff4C8613).withOpacity(0.4),
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Form(
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 125,
                        width: 130,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "نسيت كلمة المرور",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "ادخل كلمة المرور الجديدة",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    AppInput(
                      lableText: "كلمة المرور",
                      icon: "assets/icons/lock.png",
                      isPassword: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value!.toString().isEmpty) {
                          return "كلمة المرور مطلوبة ";
                        } else if (value.toString().length < 8) {
                          return "يجب ان تحتوي كلمة المرور على 8 ارقام على الأقل";
                        }
                        return null;
                      },
                    ),
                    AppInput(
                      lableText: "تأكيد كلمة المرور",
                      controller: confirmPasswordController,
                      icon: "assets/icons/lock.png",
                      isPassword: true,
                      paddingBottom: 25,
                      validator: (value) {
                        if (value!.toString().isEmpty) {
                          return "تأكيد كلمة المرور مطلوبة ";
                        }
                        else if(value!=passwordController.text){
                          return "كلمتا المرور غير متطابقتين";
                        }
                        return null;
                      },
                    ),
                    AppButton(text: "تغيير كلمة المرور", onPress: () {
                      formKey.currentState!.validate();

                    }),
                    SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "لديك حساب بالفعل ؟",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView(),));
                            },
                            child: Text(
                              "تسجيل الأن",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColor),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
