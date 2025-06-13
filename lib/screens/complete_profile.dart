import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tikare/utils/app_assets_path.dart';
import 'package:tikare/utils/app_colors.dart';
import 'package:tikare/utils/app_navigation.dart';
import 'package:tikare/utils/app_strings.dart';
import 'package:tikare/utils/app_validations.dart';
import 'package:tikare/widgets/custom_button.dart';
import 'package:tikare/widgets/custom_container.dart';
import 'dart:io';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});
  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final _formKeyCompleteProfile = GlobalKey<FormState>();
  File? _imageFile;
  bool _isUploading = false;
  @override
  void initState() {
    super.initState();
  }

   Future<void> _pickImage() async {
    final picker = ImagePicker();

    // Ask source using bottom sheet
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() => _imageFile = File(pickedFile.path));
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() => _imageFile = File(pickedFile.path));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) return;

    setState(() {
      _isUploading = true;
    });
  }

void _handleCompleteProfile(BuildContext context){
  if(_formKeyCompleteProfile.currentState!.validate()){
     print("profile completed!");
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
}
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    super.dispose();
  }


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false ,
    
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,
        title: Text(AppStrings.createProfileText),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
    child:SingleChildScrollView(
      child:Padding(
        padding:EdgeInsets.only(bottom: 16),
        child: CustomContainer(
          margin: 16,
          child: Form(
            key: _formKeyCompleteProfile,
            child: SizedBox (
              height:MediaQuery.of(context).size.height,
             child:Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width:100,
                      height:100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 4.0),
                      ),
                      child: CircleAvatar(
                        radius: 60,

                        backgroundImage:
                            _imageFile != null
                                ? FileImage(_imageFile!)
                                : AssetImage(AppAssetsPath.appLogo)
                                    as ImageProvider,
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.camera_alt, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                customTextFormField(
                  'First Name',
                  'First Name',
                  null,
                  null,
                  null,
                  _firstNameController,
                  30,
                ),
                SizedBox(height: 10),
                customTextFormField(
                  'Last Name',
                  'Last Name',
                  null,
                  null,
                  null,
                  _lastNameController,
                  30,
                ),
                SizedBox(height: 10),
                customTextFormField(
                  'Email',
                  'john@gmail.com',
                  null,
                  Icon(Icons.email, color: AppColors.appTextFieldColor),
                  null,
                  _emailController,
                  30,
                ),
                SizedBox(height: 10),
                customTextFormField(
                  'Phone Number',
                  '+123-456-789',
                  null,
                  Icon(Icons.phone, color: AppColors.appTextFieldColor),
                  null,
                  _phoneController,
                  30,
                ),
                SizedBox(height: 10),
                customTextFormField(
                  'Location',
                  'Location',
                  Icon(
                    Icons.location_disabled,
                    color: AppColors.appTextFieldColor,
                  ),
                  null,
                  null,
                  _locationController,
                  255,
                ),
                SizedBox(height: 10),
                customTextFormField(
                  'Bio',
                  'Bio',
                  null,
                  null,
                  EdgeInsets.symmetric(vertical: 30.0, horizontal: 12.0),
                  _bioController,
                  255,
                ),
                SizedBox(height:20),
                CustomButton(label:AppStrings.continueBtnText, onSubmit:(context)=>_handleCompleteProfile(context)),
                 SizedBox(height:30),
              
              ],
            ),
          ),
          ),
        ),
      ),
    ),
      ),
    );
  }

  Widget customTextFormField(
    fieldName,
    hintText,
    suffixIcon,
    prefixIcon,
    contentPadding,
    textController,
    maxLength,
  ) {
    return TextFormField(
      maxLength: maxLength,
      controller: textController,
      validator: (value) => AppValidations().isEmptyField(value, fieldName),
      decoration: InputDecoration(
        contentPadding: contentPadding ?? null,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.appBlueColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.appBlackColor, width: 2.0),
        ),
        counterText: "",
      ),
    );
  }
}
