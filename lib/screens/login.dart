import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tikare/screens/verify.dart';
import 'package:tikare/services/api/login.dart';
import 'package:tikare/utils/app_assets_path.dart';
import 'package:tikare/utils/app_colors.dart';
import 'package:tikare/utils/app_navigation.dart';
import 'package:tikare/utils/app_strings.dart';
import 'package:tikare/utils/app_validations.dart';
import 'package:tikare/widgets/custom_button.dart';
import 'package:tikare/widgets/custom_container.dart';

class LoginScreen extends StatelessWidget {
  final String? loginType;
  String _phone='';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  
  LoginScreen({super.key, required this.loginType});
   
  void _onPhoneSubmit(BuildContext context) async{
      print("this is phone : $_phone");
       showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (context) => AlertDialog(
                    title: Text("Success"),
                    content: Text("OTP send to your phone number."),
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed:
                            () => {
                              Navigator.of(context).pop(),

                              AppNavigation().pushReplacement(
                                context,
                                VerifyScreen(),
                              ),
                            },
                      ),
                    ],
                  ),
            );
  }

  void _onEmailSubmit(BuildContext context) async {
    print("email submit method");
    if (_formKey.currentState!.validate()) {
      try {
        String email = _emailController.value.text;
        // final response = await LoginService().loginByEmail(email);
        // print('response :$response');
        // if (response != null) {
        //   print("message: ${response['message']}");

        //   if (response['status'] == 1) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (context) => AlertDialog(
                    title: Text("Success"),
                    content: Text(loginType=="Email" ? AppStrings.otpEmailSendSuccessMessage : AppStrings.otpPhoneSendSuccessMessage ),
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed:
                            () => {
                              Navigator.of(context).pop(),

                              AppNavigation().pushReplacement(
                                context,
                                VerifyScreen(),
                              ),
                            },
                      ),
                    ],
                  ),
            );
          // }
        // else {
        //   //   showDialog(
        //   //     context: context,
        //   //     builder:
        //   //         (context) => AlertDialog(
        //   //           title: Text('Error'),
        //   //           content: Text(response['message']),
        //   //           actions: [
        //   //             TextButton(
        //   //               child: Text('OK'),
        //   //               onPressed: () => Navigator.of(context).pop(),
        //   //             ),
        //   //           ],
        //   //         ),
        //   //   );
        //   // }
        // }
      } catch (e) {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text('Error'),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
        );
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBlueColor,
        leading: IconButton(
          onPressed: () => AppNavigation().goBack(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: CustomContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(child: Image.asset(AppAssetsPath.appLogo)),

            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.welcomeBack,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    AppStrings.pleaseSigninToContinue,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        loginType == "Email"
                            ? TextFormField(
                              controller: _emailController,
                              validator:
                                  (value) => AppValidations().isEmptyField(
                                    value,
                                    "Email",
                                  ),
                              decoration: InputDecoration(
                                hintText: "john@email.com",
                                filled: true,
                                fillColor: AppColors.appBlueColor,
                                prefixIcon: Icon(Icons.email),
                                border: InputBorder.none,
                              ),
                            )
                            : IntlPhoneField(
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                counterText: "",
                                border: OutlineInputBorder(),
                              ),
                              initialCountryCode: 'AE',
                              
                              onChanged: (phone) {
                                print(phone.completeNumber);
                                _phone=phone.completeNumber;
                              },
                            ),

                        SizedBox(height: 10),
                        CustomButton(
                          label: AppStrings.signIn,
                          onSubmit: (context) =>loginType=="Email" ? _onEmailSubmit(context) :  _onPhoneSubmit(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
