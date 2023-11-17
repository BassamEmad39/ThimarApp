import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:circular_countdown_timer/countdown_text_format.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled3/core/design/app_button.dart';

import '../../../core/logic/helper_methods.dart';
import '../create_new_password/view.dart';
import '../forget_password/view.dart';
import '../login/view.dart';

class ConfirmCodeView extends StatefulWidget {
  final bool isActive;
  const ConfirmCodeView({Key? key,required this.isActive}): super(key: key);

  @override
  State<ConfirmCodeView> createState() => _ConfirmCodeViewState();
}

class _ConfirmCodeViewState extends State<ConfirmCodeView> {
  bool isTimerFinished= false;
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
                    PinCodeTextField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return"برجاء إدخال الكود ";
                        }else if(value.length<4){
                          return "برجاء إكمال الكود";
                        }
                        return null;
                      },
                      appContext: context,
                      length: 4,

                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15),
                        fieldHeight: 60,
                        fieldWidth: 70.75,
                        inactiveColor: Colors.grey,
                        activeFillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.number,



                    ),
                    Text(
                      widget.isActive?"تفعيل الحساب":"نسيت كلمة المرور",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          "+96602313637",
                          textDirection: TextDirection.ltr,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordView()));
                          },
                          child: Text(
                            "تغيير رقم الجوال",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    AppButton(text: "تأكيد الكود", onPress: () {
                      formKey.currentState!.validate();
                      if(widget.isActive) {
                          navigateTo(LoginView());
                        }
                      else{
                        navigateTo(CreateNewPasswordView());
                      }
                      },),
                    SizedBox(
                      height: 27,
                    ),
                    Text(
                      "لم تستلم الكود ؟ \nيمكنك إعادة إرسال الكود بعد ",
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 1.7),
                    ),
                    SizedBox(
                      height: 18.2,
                    ),

                if(!isTimerFinished)
                CircularCountDownTimer(
                  duration: 10,
                  initialDuration: 0,
                  width:60,
                  height: 60,
                  ringColor: Theme.of(context).primaryColor,
                  fillColor: Color(0xffD8D8D8),
                  strokeWidth: 3,
                  onComplete: (){
                    isTimerFinished =true;
                    setState(() {

                    });
                  },
                  isReverseAnimation: false ,
                  isReverse: true,
                  textStyle: TextStyle(
                      fontSize: 18, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.MM_SS,


                ),

                    SizedBox(
                      height: 45,
                    ),
                    if(isTimerFinished)Center(
                        child: OutlinedButton(
                            onPressed: () {
                              isTimerFinished=false;
                              setState(() {

                              });
                            }, child: Text("إعادة الإرسال"))),
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
            ),
          )
        ],
      ),
    );
  }
}
