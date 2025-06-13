import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tikare/screens/complete_profile.dart';
import 'package:tikare/services/api/login.dart';
import 'package:tikare/utils/app_assets_path.dart';
import 'package:tikare/utils/app_colors.dart';
import 'package:tikare/utils/app_font_style.dart';
import 'package:tikare/utils/app_navigation.dart';
import 'package:tikare/utils/app_strings.dart';
import 'package:tikare/utils/app_validations.dart';
import 'package:tikare/widgets/custom_button.dart';
import 'package:tikare/widgets/custom_container.dart';

class VerifyScreen extends StatefulWidget {
  VerifyScreen({super.key});
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  int _secondsRemaining = 30;
  Timer? _timer;
  bool _canResend = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  final TextEditingController _otpController5 = TextEditingController();
  final TextEditingController _otpController6 = TextEditingController();

  // FocusNodes
  final FocusNode _otpFocus1 = FocusNode();
  final FocusNode _otpFocus2 = FocusNode();
  final FocusNode _otpFocus3 = FocusNode();
  final FocusNode _otpFocus4 = FocusNode();
  final FocusNode _otpFocus5 = FocusNode();
  final FocusNode _otpFocus6 = FocusNode();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    print("timer.");
    _canResend = false;
    _secondsRemaining = 30;

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
        setState(() {
          _canResend = true;
        });
      }
    });
  }

  void _resendOtp() {
    if (_canResend) {
      print('OTP Resent');
      _startTimer();
    }
  }

  @override
  void dispose() {
    _otpController1.dispose();
    _otpController2.dispose();
    _otpController3.dispose();
    _otpController4.dispose();
    _otpController5.dispose();
    _otpController6.dispose();

    _otpFocus1.dispose();
    _otpFocus2.dispose();
    _otpFocus3.dispose();
    _otpFocus4.dispose();
    _otpFocus5.dispose();
    _otpFocus6.dispose();
    _timer?.cancel();
    super.dispose();
  }
 
 void _otpVerified(BuildContext context) async{
    print("otp verified!");
    showDialog(
              context: context,
              barrierDismissible: false, // user can't tap outside to dismiss
              builder:
                  (context) => AlertDialog(
                    title: Text("Success"),
                    content: Text(AppStrings.otpVerifiedSuccessfullyMessage),
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed: () => {
                          Navigator.of(context).pop(),

                        AppNavigation().pushReplacement(context, CompleteProfileScreen())
                        }
                      ),
                    ],
                  ),
            );
 }
  // void _onOtpSubmit(BuildContext context) async {
  //   print("otp submit method");
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       String code = _otpController.value.text;
  //       final response = await LoginService().loginByEmail(email);
  //       print('response :$response');
  //       if (response != null) {
  //         print("message: ${response['message']}");

  //         if (response['status'] == 1) {

  //           showDialog(
  //             context: context,
  //             barrierDismissible: false, // user can't tap outside to dismiss
  //             builder:
  //                 (context) => AlertDialog(
  //                   title: Text("Success"),
  //                   content: Text("${response['message']}"),
  //                   actions: [
  //                     TextButton(
  //                       child: Text('OK'),
  //                       onPressed: () => {
  //                         Navigator.of(context).pop(),

  //                       AppNavigation().pushReplacement(context, VerifyScreen())
  //                       }
  //                     ),
  //                   ],
  //                 ),
  //           );

  //         } else {
  //           showDialog(
  //             context: context,
  //             builder:
  //                 (context) => AlertDialog(
  //                   title: Text('Error'),
  //                   content: Text(response['message']),
  //                   actions: [
  //                     TextButton(
  //                       child: Text('OK'),
  //                       onPressed: () => Navigator.of(context).pop(),
  //                     ),
  //                   ],
  //                 ),
  //           );
  //         }
  //       }
  //     } catch (e) {
  //       showDialog(
  //         context: context,
  //         builder:
  //             (context) => AlertDialog(
  //               title: Text('Error'),
  //               content: Text(e.toString()),
  //               actions: [
  //                 TextButton(
  //                   child: Text('OK'),
  //                   onPressed: () => Navigator.of(context).pop(),
  //                 ),
  //               ],
  //             ),
  //       );
  //     }
  //   } else {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,
        // leading: IconButton(
        //   onPressed: () => AppNavigation().goBack(context),
        //   icon: Icon(Icons.arrow_back_ios),
        // ),
      ),
      body: CustomContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(child: Image.asset(AppAssetsPath.appLogo)),

            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      AppStrings.oneTimePassword,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      AppStrings.enterYourOtp,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            customOTPContainer(
                              "1",
                              _otpController1,
                              _otpFocus1,
                              _otpFocus2,
                              null,
                            ),
                            SizedBox(width: 10),
                            customOTPContainer(
                              "2",
                              _otpController2,
                              _otpFocus2,
                              _otpFocus3,
                              _otpFocus1,
                            ),
                            SizedBox(width: 10),
                            customOTPContainer(
                              "3",
                              _otpController3,
                              _otpFocus3,
                              _otpFocus4,
                              _otpFocus2,
                            ),
                            SizedBox(width: 10),
                            customOTPContainer(
                              "4",
                              _otpController4,
                              _otpFocus4,
                              _otpFocus5,
                              _otpFocus3,
                            ),
                            SizedBox(width: 10),
                            customOTPContainer(
                              "5",
                              _otpController5,
                              _otpFocus5,
                              _otpFocus6,
                              _otpFocus4,
                            ),
                            SizedBox(width: 10),
                            customOTPContainer(
                              "6",
                              _otpController6,
                              _otpFocus6,
                              null,
                              _otpFocus5,
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        CustomButton(
                          label: AppStrings.continueBtnText,
                          onSubmit: (context) => _otpVerified(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: CircularProgressIndicator(
                      value: _secondsRemaining / 30,
                      strokeWidth: 4,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  Text('$_secondsRemaining'),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: AppStrings.didNotReceiveTheCode,
                    style: TextStyle(color: AppColors.appBlackColor),
                    children: [
                      TextSpan(
                        text: AppStrings.resendText,
                        style: TextStyle(
                          color: _canResend ? AppColors.appBlackColor : AppColors.appGreyColor,
                          fontWeight: FontWeight.bold,
                          decoration: _canResend ? TextDecoration.underline : TextDecoration.none,
                        ),
                        recognizer:_canResend ? (TapGestureRecognizer()  
                              ..onTap =_resendOtp) : null
                      ),
                    ],
                  ),
                ),
              ),

              // child:Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //      Text(AppStrings.didNotReceiveTheCode),
              //      SizedBox(width:5,),
              //      Text(AppStrings.resendText,style:AppFontStyle.underLineBoldText)
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customOTPContainer(
    hintText,
    otpController,
    otpFocus,
    nextFocus,
    previousFocus,
  ) {
    return Container(
      width: 45,
      height: 50,
      child: TextFormField(
        focusNode: otpFocus,
        maxLength: 1,
        onChanged: (value) {
          if (value.isEmpty && previousFocus != null) {
            FocusScope.of(context).requestFocus(previousFocus);
          } else if (value != null && nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
        onFieldSubmitted: (_) {
          if (nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          } else {
            otpFocus.unfocus();
          }
        },
        textInputAction: TextInputAction.next,
        controller: otpController,
        validator: (value) => AppValidations().isEmptyField(value, "OTP"),
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.appBlueColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.appBlackColor, width: 2.0),
          ),
          counterText: "",
        ),
      ),
    );
  }
}
