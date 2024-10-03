import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/responsive.dart';
import '../widgets/rounded_btn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formkey = GlobalKey<FormState>();
  bool passwordShow=true;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Responsive(
        mobile: _LoginScreenMobile(),
        desktop: _LoginScreenDesktop(),
      ),
    )
    );
  }
}


class _LoginScreenDesktop extends StatefulWidget {
  const _LoginScreenDesktop({Key key}) : super(key: key);

  @override
  State<_LoginScreenDesktop> createState() => _LoginScreenDesktopState();
}

class _LoginScreenDesktopState extends State<_LoginScreenDesktop> {

  final _formkey = GlobalKey<FormState>();
  bool passwordShow=true;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(
          color: Palette.facebookBlue,
          child: Center(
            child: Text("My Social",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize:32.sp),
            ),
          ),
        )),
        Expanded(
            child:Padding(
              padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Let's ", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20.sp),),
                      Text("Sign In 👇", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.sp),),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Text("Sign up to see photos and videos from your friends.",style: TextStyle(fontWeight: FontWeight.w400),),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text("Email or phone number or username",style: TextStyle(fontWeight: FontWeight.w800),),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    controller: _email,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email or phone number or username",
                                    ),
                                    cursorColor: Palette.facebookBlue,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please fill out this field!";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("Password",style: TextStyle(fontWeight: FontWeight.w800),),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    controller: _password,
                                    obscureText: passwordShow,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      suffixIcon: IconButton(onPressed: (){
                                        setState(() {
                                          passwordShow =!passwordShow;
                                        });
                                      },
                                        icon: Icon(
                                          passwordShow?
                                          Icons.visibility_off : Icons.visibility,color: Palette.facebookBlue,),
                                      ),
                                    ),
                                    cursorColor: Palette.facebookBlue,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please fill out this field!";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(alignment: Alignment.centerRight,
                                child: TextButton(onPressed: (){}, child: Text("Forget password ?", style: TextStyle(color: Palette.facebookBlue,fontWeight: FontWeight.w600),))),
                            const SizedBox(height: 20,),
                            RoundedBTN(width: 200, text: "Sign In", onPressed: (){
                              if(_formkey.currentState.validate()){
                                print("Hello");
                              }
                            }),
                          ],
                        )),
                  )
                ],
              ),
            ) ),
      ],
    );
  }
}


class _LoginScreenMobile extends StatefulWidget {
  const _LoginScreenMobile({Key key}) : super(key: key);

  @override
  State<_LoginScreenMobile> createState() => _LoginScreenMobileState();
}

class _LoginScreenMobileState extends State<_LoginScreenMobile> {

  final _formkey = GlobalKey<FormState>();
  bool passwordShow=true;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("My Social",style: TextStyle(color: Palette.facebookBlue,fontWeight: FontWeight.w800,fontSize:32.sp),
              ),
            ),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Text("Let's ", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.sp),),
                Text("Sign In 👇", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.sp),),
              ],
            ),
            SizedBox(height: 10.h,),
            Text("Sign up to see photos and videos from your friends.",style: TextStyle(fontWeight: FontWeight.w400),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text("Email or phone number or username",style: TextStyle(fontWeight: FontWeight.w800),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email or phone number or username",
                              ),
                              cursorColor: Palette.facebookBlue,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please fill out this field!";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Password",style: TextStyle(fontWeight: FontWeight.w800),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextFormField(
                              controller: _password,
                              obscureText: passwordShow,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                suffixIcon: IconButton(onPressed: (){
                                  setState(() {
                                    passwordShow =!passwordShow;
                                  });
                                },
                                  icon: Icon(
                                    passwordShow?
                                    Icons.visibility_off : Icons.visibility,color: Palette.facebookBlue,),
                                ),
                              ),
                              cursorColor: Palette.facebookBlue,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please fill out this field!";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(alignment: Alignment.centerRight,
                          child: TextButton(onPressed: (){}, child: Text("Forget password ?", style: TextStyle(color: Palette.facebookBlue,fontWeight: FontWeight.w600),))),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: double.infinity,
                        child: RoundedBTN(text: "Sign In", onPressed: (){
                          if(_formkey.currentState.validate()){
                            print("Hello");
                          }
                        }),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
