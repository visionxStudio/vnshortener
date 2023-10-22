// import 'package:flutter/material.dart';
// import 'package:likhitexam/common/constants/constants.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// import '../../common/widgets/text/custom_normal_text_widget.dart';

// class WebviewPage extends StatelessWidget {
//   final String url;
//   final String title;
//   const WebviewPage({Key? key, required this.url, required this.title})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kWhiteColor,
//         elevation: 0.0,
//         iconTheme: const IconThemeData(color: kPrimaryColor),
//         title: NormalText(
//           title,
//           isBold: true,
//         ),
//       ),
//       body: WebView(
//         javascriptMode: JavascriptMode.unrestricted,
//         initialUrl: url,
//       ),
//     );
//   }
// }
