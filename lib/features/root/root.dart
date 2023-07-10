import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkshortener/features/root/selection_provider.dart';
import 'package:linkshortener/features/root/shared_pref_provider.dart';

import 'package:lottie/lottie.dart';

import '../../common/app_utils.dart';
import '../../routes/app_router.gr.dart';
import '../homepage/homepage.dart';

// class Root extends ConsumerStatefulWidget {
//   const Root({Key? key}) : super(key: key);

//   @override
//   _RootState createState() => _RootState();
// }

// class _RootState extends ConsumerState<Root> {
//   @override
//   void initState() {
//     super.initState();
//     ref.read(connectivityNotifierProvider);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ref.watch(connectivityNotifierProvider).hasInternetConnection
//         ? const WebViewPage()
//         : WillPopScope(
//             onWillPop: () async {
//               return (await showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: const Text('Are you sure?'),
//                       content: const Text('Do you want to exit the App'),
//                       actions: <Widget>[
//                         TextButton(
//                           onPressed: () => Navigator.of(context).pop(false),
//                           child: const Text('No'),
//                         ),
//                         TextButton(
//                           onPressed: () => Navigator.of(context).pop(true),
//                           child: const Text('Yes'),
//                         ),
//                       ],
//                     ),
//                   )) ??
//                   false;
//             },
//             child: const NoConnectivityScreen());
//   }
// }

class Root extends StatelessWidget {
  const Root({Key? key, this.isSwitching = false}) : super(key: key);
  final bool isSwitching;

  @override
  Widget build(BuildContext context) {
    // print(isSwitching);
    SizeConfig().init(context);
    return isSwitching
        ? const SelectionWidget()
        : SharedPrefProvider.instance.getBool("default")!
            ? WebViewPage(
                url: SharedPrefProvider.instance.getString("url")!,
              )
            : const SelectionWidget();
  }
}

class SelectionWidget extends StatelessWidget {
  const SelectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight * 0.9,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30.0),
                LottieBuilder.asset(
                  "assets/images/welcome.json",
                  fit: BoxFit.cover,
                  height: SizeConfig.screenHeight * 0.1,
                ),
                // const ChooseShortener(),
                Text(
                  "Please Choose Your Shortener",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Image.asset(
                  "assets/images/decide.png",
                  width: double.infinity,
                  height: SizeConfig.screenHeight * 0.3,
                ),
                // const SizedBox(height: 30.0),
                Consumer(builder: (context, ref, child) {
                  final selectionPro = ref.watch(selectionProvider);
                  return Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            selectionPro.changeSelectedIndex(0);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8.0),
                              border: selectionPro.selectedIndex == 0
                                  ? Border.all(
                                      color: Colors.blueAccent,
                                      width: 2,
                                    )
                                  : null,
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(200.0),
                                  child: Image.asset(
                                    "assets/images/nest.jpg",
                                    height: 106,
                                    width: 106,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                const Text(
                                  "Nestshortener",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            selectionPro.changeSelectedIndex(1);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8.0),
                              border: selectionPro.selectedIndex == 1
                                  ? Border.all(
                                      color: Colors.blueAccent,
                                      width: 2,
                                    )
                                  : null,
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(200.0),
                                  child: Image.asset(
                                    "assets/images/applogo.png",
                                    height: 106,
                                    width: 106,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                const Text(
                                  "Vnshortener",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                const Spacer(),
                Column(
                  children: [
                    Row(
                      children: [
                        Consumer(builder: (context, ref, child) {
                          final status = ref.watch(selectionProvider);
                          return Checkbox(
                            value: status.rememberSelection,
                            onChanged: ((value) {
                              status.changeRememberSelection(value!);
                            }),
                          );
                        }),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Text("Select as default")
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Consumer(builder: (context, ref, child) {
                      final selectionPro = ref.read(selectionProvider);
                      return GestureDetector(
                        onTap: () {
                          if (selectionPro.selectedIndex == -1) {
                            const snackBar = SnackBar(
                              content:
                                  Text('Please select any one of the website'),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }

                          if (selectionPro.selectedIndex == 0) {
                            context.router.replace(WebViewPageRoute(
                                key: const ValueKey("nestshortener"),
                                url: "https://nestshortener.com"));
                          }
                          if (selectionPro.selectedIndex == 1) {
                            context.router.replace(WebViewPageRoute(
                                key: const ValueKey("vnshortener"),
                                url: "https://vnshortener.com"));
                          }

                          if (selectionPro.selectedIndex != -1) {
                            selectionPro.continuePressed();
                          }
                        },
                        child: Container(
                          height: 50.0,
                          width: SizeConfig.screenWidth * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: const Center(
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChooseShortener extends StatelessWidget {
  const ChooseShortener({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: 0,
                child: Text(
                  ":)",
                  style: TextStyle(
                    fontSize: 18 + 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select",
                    style: TextStyle(
                      fontSize: 18 + 6,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "One",
                    style: TextStyle(
                      fontSize: 18 + 6,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
