import 'package:flutter/material.dart';
import 'package:untitled3/core/design/app_button.dart';
import 'package:untitled3/core/design/app_input.dart';
import 'package:untitled3/models/cities.dart';
import 'package:untitled3/views/Sheets/cities.dart';
import '../../../core/logic/helper_methods.dart';
import '../confirm_code/view.dart';
import '../login/view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isHidden = true;
  CityModel? selectedCity;
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
                      "يمكنك تسجيل حساب جديد الأن",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    AppInput(
                        paddingTop: 27,
                        lableText: "إسم المستخدم",
                        icon: "assets/icons/user.png",
                      validator:  (value) {
                        if(value!.isEmpty){
                          return"إسم المستخدم مطلوب ";
                        }else if(value.length<2){
                          return "برجاء إدخال الإسم كاملًا";
                        }
                        return null;
                      },
                    ),

                    StatefulBuilder(
                      builder: (context, setState2) => GestureDetector(
                        onTap: () async {
                          var result = await showModalBottomSheet(
                            context: context,
                            builder: (context) => CitiesSheet(),
                          );
                          if (result != null){
                            selectedCity = result;
                            setState(() {});
                            print("The result is ${selectedCity!.name}");

                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AppInput(
                                  lableText: selectedCity?.name ?? "المدينة",
                                  isEnabled: false,
                                  paddingBottom: 0,
                                  icon: "assets/icons/city.png"),
                            ),
                            if(selectedCity!=null)
                            IconButton(onPressed: () {
                              selectedCity=null;
                              setState(() {

                              });
                            }, icon: Icon(Icons.clear,size: 30,color: Colors.red,))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    AppInput(
                      validator: (value) {
                        if(value!.isEmpty){
                          return"رقم الهاتف مطلوب ";
                        }else if(value.length<9){
                          return "يجب ان يكون رقم الهاتف 9 ارقام";
                        }
                        return null;
                      },
                        lableText: "رقم الجوال",
                        isPhone: true,
                        icon: "assets/icons/phone.png"),
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
                    AppInput(
                      lableText: "تأكيد كلمة المرور",
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
                    AppButton(
                      text: 'تسجيل',
                      onPress: () {
                        if(formKey.currentState!.validate()){
                          navigateTo(ConfirmCodeView(isActive: true));
                        }

                      },
                    ),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginView(),
                                  ));
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
