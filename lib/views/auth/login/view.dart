import 'package:flutter/material.dart';
import 'package:untitled3/core/design/app_button.dart';
import 'package:untitled3/core/design/app_input.dart';

import '../forget_password/view.dart';
import '../register/view.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey =GlobalKey<FormState>();
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
                          "مرحبا بك مرة أخرى",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "يمكنك تسجيل الدخول الآن",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                        ),

                        AppInput(
                          isPhone: true,
                          paddingTop: 27,
                          lableText: 'رقم الجوال',
                          icon: "assets/icons/phone.png",
                          validator: (value) {
                            if(value!.isEmpty){
                              return"رقم الهاتف مطلوب ";
                            }else if(value.length<9){
                              return "يجب ان يكون رقم الهاتف 9 ارقام";
                            }
                            return null;
                          },
                        ),
                        AppInput(
                            lableText: "كلمة المرور",
                            icon: "assets/icons/lock.png",
                            isPassword: true,
                          validator: (value) {
                            if(value!.isEmpty){
                              return"كلمة المرور مطلوبة ";
                            }else if(value.length<8){
                              return "يجب ان تحتوي كلمة المرور على 8 ارقام على الأقل";
                            }
                            return null;
                          },
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordView(),));
                          },
                          child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(
                                "نسيت كلمة المرور ؟",
                                style:
                                    TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                              )),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        AppButton(text: "تسجيل الدخول", onPress: () {
                          formKey.currentState!.validate();
                        }),

                        SizedBox(
                          height: 45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ليس لديك حساب ؟",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterView(),));

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
          )],

                      ),
    );
  }
}
