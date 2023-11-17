import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final String lableText,icon;
  final bool isPhone,isPassword,isEnabled;
  final FormFieldValidator? validator;
  final TextEditingController? controller;

  final double paddingBottom,paddingTop;
  const AppInput({super.key,this.controller, required this.lableText,this.isEnabled=true,   this.isPhone=false, required this.icon, this.paddingBottom=16,  this.paddingTop=0,  this.isPassword=false,   this.validator });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: widget.paddingBottom,top: widget.paddingTop),
      child: TextFormField(
        keyboardType: widget.isPhone?TextInputType.phone:TextInputType.text,
        controller: widget.controller,
        enabled: widget.isEnabled,
        validator: widget.validator,
        obscureText: isPasswordHidden&&widget.isPassword,
        decoration: InputDecoration(
          labelText: widget.lableText,
          suffixIcon: widget.isPassword?IconButton(
            icon: Icon(
                isPasswordHidden? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              isPasswordHidden = !isPasswordHidden;
              setState(() {});
            },
          ):null,
          icon: widget.isPhone?Container(
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset("assets/images/saudi.png",
                    fit: BoxFit.scaleDown,
                    width: 32,
                    height: 20,

                  ),
                ),

                Text(
                  ("+966"),
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color(0xffF3F3F3)),
            ),
          ):null,
          prefixIcon: Image.asset(widget.icon,
          fit: BoxFit.scaleDown,
            height: 20,
            width: 18,),
        ),
      ),
    );
  }
}
