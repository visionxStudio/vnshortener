import 'package:flutter/material.dart';

import 'custom_bottom_nav.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 85.0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(width, 85.0),
            painter: BottomNavigationCustomPaint(),
          ),
          Center(
            child: SizedBox(
              height: 70.0,
              width: 70.0,
              child: FloatingActionButton(
                backgroundColor: const Color(0xff2B3674),
                elevation: 0.0,
                onPressed: () {},
                child: const Icon(
                  Icons.home,
                  size: 45.0,
                ),
              ),
            ),
          ),
          SizedBox(
            width: width,
            height: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.report,
                    size: 45.0,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                  splashColor: Colors.white,
                ),
                IconButton(
                    icon: const Icon(
                      Icons.restaurant_menu,
                      size: 45.0,
                      color: Colors.grey,
                    ),
                    onPressed: () {}),
                Container(
                  width: width * 0.10,
                ),
                IconButton(
                    icon: const Icon(
                      Icons.bookmark,
                      size: 45.0,
                      color: Colors.grey,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      size: 45.0,
                      color: Colors.grey,
                    ),
                    onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
