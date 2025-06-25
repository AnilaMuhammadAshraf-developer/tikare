import 'package:flutter/material.dart';
import 'package:tikare/utils/app_assets_path.dart';
import 'package:tikare/utils/app_colors.dart';
import 'package:tikare/utils/app_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   void _onTap(){
    print("on tap");
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.inCommingRequest,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),

            ...List.generate(10, (index) {
              return Column(
                children: [
                  Padding(padding: EdgeInsets.all(16), child: customCard()),
              
                //   Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     customButton(AppStrings.acceptText,AppColors.appBlueColor,AppColors.appBlackColor),
                //     SizedBox(width:20),
                //      customButton(AppStrings.rejectText,AppColors.appRedColor,AppColors.appWhiteColor),
                //   ],
                // ),
                ],
              );
            }),
              
          ],
        ),
      ),
    );
  }

  Widget customCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 156,
      decoration: BoxDecoration(
        color: AppColors.appMainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child:Column(
        children: [
              Container(
        width: MediaQuery.of(context).size.width,
         height: 120,
      decoration: BoxDecoration(
        color: AppColors.appWhiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 9),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "John Smith",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 10, top: 10),
                      child: CircleAvatar(
                        radius: 20,

                        child: Image.asset(AppAssetsPath.appImg, height: 20),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.appBlueColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Icon(Icons.location_on)),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Location",
                      style: TextStyle(
                        color: AppColors.appGreyColor,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "9:00am",
                        style: TextStyle(
                          color: AppColors.appGreyColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: Offset(3, -15),
                        child: Row(
                          children: [
                            Text(
                              "Richardson,California62639",
                              style: TextStyle(
                                color: AppColors.appGreyColor,
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(width: 20),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "Monday Oct 05, 2023",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
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
        ],
      ),
        
      ),
      Transform.translate(offset: Offset(0, -21),
      child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customButton(AppStrings.acceptText,AppColors.appBlueColor,AppColors.appBlackColor,_onTap),
                    SizedBox(width:20),
                     customButton(AppStrings.rejectText,AppColors.appRedColor,AppColors.appWhiteColor,_onTap),
                  ],
                ),
      ),
        ],
      ),
   
    );
  }

  Widget customButton(label, color, textColor,onTap) {
    return InkWell(
      onTap:onTap,
    child:Container(
      width:120,
      height:35,
      decoration: BoxDecoration(color: color,
      borderRadius:BorderRadius.circular(10)
      ),
      child:Center(child:Text(label, style: TextStyle(color: textColor,fontWeight: FontWeight.bold))),
    ),);
  }
}
