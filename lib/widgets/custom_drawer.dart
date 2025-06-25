import 'package:flutter/material.dart';
import 'package:tikare/screens/splash.dart';
import 'package:tikare/utils/app_assets_path.dart';
import 'package:tikare/utils/app_colors.dart';
import 'package:tikare/utils/app_navigation.dart';
import 'package:tikare/utils/app_strings.dart';

class CustomDrawer extends StatelessWidget {
  final List<Map<String, dynamic>> pages;

  const CustomDrawer({super.key, required this.pages});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.appDrawerColor2, AppColors.appDrawerColor1],
          ),
        ),
        child: DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.appBlackColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () {
                      print("close the drawer ");
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close, color: AppColors.appWhiteColor),
                  ),
                ),
              ),

              Transform.translate(
                offset: Offset(0, -31),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(AppAssetsPath.appDefault),
                    ),
                    Text(
                      AppStrings.userName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      AppStrings.userEmail,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children:
                    ListTile.divideTiles(
                      color: AppColors.appBlackColor,
                      context: context,
                      tiles:
                          pages.map<Widget>((page) {
                            return ListTile(
                              dense: true,
                              leading: page['icon'],
                              title: Text(
                                page['title'],
                                style: TextStyle(
                                  color: AppColors.appBlackColor,
                                ),
                              ),
                              onTap: () {
                                print(
                                  "drawer selected function ${page['screen']}",
                                );
                                AppNavigation().pushTo(context, page['screen']);
                              },
                            );
                          }).toList(),
                    ).toList(),
              ),
              SizedBox(height: 30),

              InkWell(
                onTap: () {
                  print("yes");
                  showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (context) => AlertDialog(
                    title: Text("Success"),
                    content: Text("Logout Successfully."),
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed:
                            () => {
                              Navigator.of(context).pop(),

                                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                    (Route<dynamic> route) => false,
                  )
                            },
                      ),
                  
                    ],
                  ),
                  );
                },
                child: Align(
                  alignment: Alignment.bottomLeft,

                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Container(
                      width: 120,
                      height: 40,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.appBlueColor,
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.appDrawerColor1,

                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.power_settings_new,
                              color: AppColors.appBlueColor,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            AppStrings.logout,
                            style: TextStyle(color: AppColors.appBlackColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
