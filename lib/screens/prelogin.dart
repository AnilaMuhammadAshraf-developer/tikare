import 'package:flutter/material.dart';
import 'package:tikare/screens/complete_profile.dart';
import 'package:tikare/screens/content.dart';
import 'package:tikare/screens/login.dart';
import 'package:tikare/services/api/content.dart';
import 'package:tikare/utils/app_assets_path.dart';
import 'package:tikare/utils/app_colors.dart';
import 'package:tikare/utils/app_font_style.dart';
import 'package:tikare/utils/app_navigation.dart';
import 'package:tikare/utils/app_strings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tikare/widgets/custom_container.dart';
import 'package:tikare/widgets/custom_social_button.dart';

class PreloginScreen extends StatefulWidget {
  PreloginScreen({super.key});
  @override
  _PreLoginScreenState createState() => _PreLoginScreenState();
}

class _PreLoginScreenState extends State<PreloginScreen> {
  late List<Map<String, dynamic>> buttonList;
  @override
  void initState() {
    super.initState();
    buttonList = [
      {
        "label": AppStrings.signInWithEmail,
        "icon": Icons.email,
        "onTapWithType": () => onSelection('Email'),
        "bgColor": AppColors.appBlueColor,
        "textColor": AppColors.appBlackColor,
        "iconColor": AppColors.appBlackColor,
      },
      {
        "label": AppStrings.signInWithPhone,
        "icon": Icons.phone,
        "onTapWithType": () => onSelection('Phone'),
        "bgColor": AppColors.appBlueColor,
        "textColor": AppColors.appBlackColor,
        "iconColor": AppColors.appBlackColor,
      },
      {
        "label": AppStrings.signInWithGoogle,
        "icon": FontAwesomeIcons.google,
        "onTapWithType": () => onSelection('Google'),
        "bgColor": AppColors.appRedColor,
        "textColor": AppColors.appWhiteColor,
        "iconColor": AppColors.appWhiteColor,
      },
      {
        "label": AppStrings.signInWithApple,
        "icon": Icons.apple,
        "onTapWithType": () => onSelection('Apple'),
        "bgColor": AppColors.appBlackColor,
        "textColor": AppColors.appWhiteColor,
        "iconColor": AppColors.appWhiteColor,
      },
    ];
  }

  void onSelection(String? loginType) {
    print("this is type $loginType");
    if (loginType == "Email" || loginType == "Phone") {
        AppNavigation().pushTo(context, LoginScreen(loginType: loginType));
    }else{
      showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (context) => AlertDialog(
                    title: Text("Success"),
                    content: Text(AppStrings.loginSuccessfullyMessage),
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed:
                            () => {
                              Navigator.of(context).pop(),

                              AppNavigation().pushReplacement(
                                context,
                                CompleteProfileScreen(),
                              ),
                            },
                      ),
                    ],
                  ),
            );
    }
  }

  void _content(type) async {
    try {
      String url = await ContentService().getContentUrl(type);
      AppNavigation().pushTo(context, ContentScreen(url: url, type: type));
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        child: Column(
          children: [
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.all(18),
              child: Image.asset(AppAssetsPath.appLogo),
            ),
            ...buttonList.asMap().entries.map((entry) {
              var item = entry.value;
              return CustomSocialButton(
                label: item['label'],
                icon: item['icon'],
                onTapWithType: item['onTapWithType'],
                iconColor: item['iconColor'],
                bgColor: item['bgColor'],
                textColor: item['textColor'],
              );
            }),

            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  Text(AppStrings.bySignin),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => _content('tc'),
                        child: Text(
                          AppStrings.termsCondition,
                          style: AppFontStyle.underLineText,
                        ),
                      ),
                      SizedBox(width: 5),

                      Text(AppStrings.andText),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () => _content('pp'),
                        child: Text(
                          AppStrings.privacyPolicy,
                          style: AppFontStyle.underLineText,
                        ),
                      ),
                    ],
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
