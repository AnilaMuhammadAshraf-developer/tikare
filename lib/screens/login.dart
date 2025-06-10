import 'package:flutter/material.dart';
import 'package:tikare/models/user_model.dart';
import 'package:tikare/screens/master.dart';
import 'package:tikare/screens/verify.dart';
import 'package:tikare/services/api/login.dart';
import 'package:tikare/utils/app_assets_path.dart';
import 'package:tikare/utils/app_colors.dart';
import 'package:tikare/utils/app_font_style.dart';
import 'package:tikare/utils/app_navigation.dart';
import 'package:tikare/utils/app_strings.dart';
import 'package:tikare/utils/app_validations.dart';
import 'package:tikare/widgets/custom_button.dart';
import 'package:tikare/widgets/custom_container.dart';

class LoginScreen extends StatelessWidget {
  final String? loginType;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  LoginScreen({super.key, required this.loginType});
  void _onEmailSubmit(BuildContext context) async {
    print("email submit method");
    if (_formKey.currentState!.validate()) {
      try {
        String email = _emailController.value.text;
        final response = await LoginService().loginByEmail(email);
        print('response :$response');
        if (response != null) {
          print("message: ${response['message']}");

          if (response['status'] == 1) {
            
            showDialog(
              context: context,
              barrierDismissible: false, // user can't tap outside to dismiss
              builder:
                  (context) => AlertDialog(
                    title: Text("Success"),
                    content: Text("${response['message']}"),
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed: () => {
                          Navigator.of(context).pop(),
                          
                        AppNavigation().pushReplacement(context, VerifyScreen())
                        }
                      ),
                    ],
                  ),
            );

           

          } else {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text(response['message']),
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
            );
          }
        }
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
                        TextFormField(
                          controller: _emailController,
                          validator:
                              (value) =>
                                  AppValidations().isEmptyField(value, "Email"),
                          decoration: InputDecoration(
                            hintText: "john@email.com",
                            filled: true,
                            fillColor: AppColors.appBlueColor,
                            prefixIcon: Icon(Icons.email),
                            border: InputBorder.none,
                          ),
                        ),
                        SizedBox(height: 10),
                        CustomButton(
                          label: AppStrings.signIn,
                          onSubmit: (context) => _onEmailSubmit(context),
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
