import 'package:flutter/material.dart';
import 'package:tikare/utils/app_strings.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentScreen extends StatelessWidget {
  final String url;
  final String type;
  const ContentScreen({super.key, required this.url,required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:type=='pp' ? Text(AppStrings.privacyPolicy) : Text(AppStrings.termsCondition) ),
      body: WebViewWidget(
        controller: WebViewController()..loadRequest(Uri.parse(AppStrings.dummyContentURL)),
      ),
    );
  }
}
