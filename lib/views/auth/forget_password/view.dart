import 'package:flutter/material.dart';
import 'package:untitled3/core/design/app_button.dart';
import 'package:untitled3/core/design/app_input.dart';
import 'package:untitled3/core/logic/helper_methods.dart';

import '../confirm_code/view.dart';
import '../login/view.dart';


class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  bool isHidden = true;
  final formKey = GlobalKey<FormState>();
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
                    "أدخل رقم الجوال المرتبط بحسابك",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),

                  Form(
                    key: formKey,
                    child: AppInput(
                      lableText: "رقم الجوال",
                      icon: "assets/icons/phone.png",
                      isPhone: true,
                      paddingTop: 28,
                      paddingBottom: 21,
                      validator: (value) {
                      if(value!.isEmpty){
                        return"رقم الهاتف مطلوب ";
                      }else if(value.length<9){
                        return "يجب ان يكون رقم الهاتف 9 ارقام";
                      }
                      return null;
                    },
                    ),
                  ),
                  AppButton(onPress:  () {
                    if(formKey.currentState!.validate()){
                      navigateTo(ConfirmCodeView(isActive: false));
                    }

                  },
                    text: "تأكيد رقم الجوال", ),
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
                            "تسجيل الدخول",
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
          )
        ],
      ),
    );
  }
}
