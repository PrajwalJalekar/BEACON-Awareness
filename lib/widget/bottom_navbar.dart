// lib/widget/bottom_navbar.dart
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../widget/navigator.dart';

class AnimatedBottomNavBar extends StatefulWidget {
  final int initialIndex;

  AnimatedBottomNavBar({required this.initialIndex});

  @override
  _AnimatedBottomNavBarState createState() => _AnimatedBottomNavBarState();
}

class _AnimatedBottomNavBarState extends State<AnimatedBottomNavBar>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  void didChangeDependencies() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 375),
    );

    animation = Tween(
      begin: getEndPosition(selectedIndex),
      end: getEndPosition(selectedIndex),
    ).animate(controller);

    super.didChangeDependencies();
  }

  double getEndPosition(int index) {
    double width = MediaQuery.of(context).size.width;
    double valueToOmit = 2 * 15.0 + 2 * 40.0; // Total margin and padding

    return (((width - valueToOmit) / 4) * index +
            40.0) + // 40.0 is horizontalPadding in your original code
        ((width - valueToOmit) / 4) / 2 -
        70.0;
  }

  void animateDrop(int index) {
    animation = Tween(
      begin: animation.value,
      end: getEndPosition(index),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutBack,
      ),
    );
    controller.forward().then((value) {
      setState(() {
        selectedIndex = index;
      });
      controller.dispose();
      controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
      );

      switch (selectedIndex) {
        case 0:
          AppNavigator.navigateTo(context, AppNavigator.homeRoute);
          break;
        case 1:
          AppNavigator.navigateTo(context, AppNavigator.educationRoute);
          break;
        case 2:
          AppNavigator.navigateTo(context, AppNavigator.governmentRoute);
          break;
        case 3:
          AppNavigator.navigateTo(context, AppNavigator.agricultureRoute);
          break;

        // Add more cases for additional screens
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return CustomPaint(
          painter: AppBarPainter(animation.value),
          size: Size(
            MediaQuery.of(context).size.width - (2 * 15.0),
            80.0,
          ),
          child: SizedBox(
            height: 120.0,
            width: MediaQuery.of(context).size.width - (2 * 15.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildNavItem(0, 'Home', Icons.home),
                  buildNavItem(1, 'Education', Icons.school),
                  buildNavItem(2, 'Government', Icons.account_balance),
                  buildNavItem(3, 'Agriculture', Icons.eco),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildNavItem(int index, String label, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          animateDrop(index);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeOut,
        height: 105,
        width:
            (MediaQuery.of(context).size.width - (2 * 15.0) - (2 * 40.0)) / 4,
        padding: const EdgeInsets.only(top: 17.5, bottom: 22.5),
        alignment: selectedIndex == index
            ? Alignment.topCenter
            : Alignment.bottomCenter,
        child: SizedBox(
          height: 35.0,
          width: 35.0,
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeOut,
              child: selectedIndex == index
                  ? Icon(
                      icon,
                      key: ValueKey('yellow$label'),
                      size: 30.0,
                      color: Color.fromARGB(
                          255, 12, 27, 128), // Change the color as needed
                    )
                  : Icon(
                      icon,
                      key: ValueKey('white$label'),
                      size: 30.0,
                      color: Colors.black87,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarPainter extends CustomPainter {
  double x;

  AppBarPainter(this.x);

  double height = 80.0;
  double start = 40.0;
  double end = 120;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromRGBO(255, 255, 255, 1)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0.0, start);

    path.lineTo((x) < 20.0 ? 20.0 : x, start);
    path.quadraticBezierTo(20.0 + x, start, 30.0 + x, start + 30.0);
    path.quadraticBezierTo(40.0 + x, start + 55.0, 70.0 + x, start + 55.0);
    path.quadraticBezierTo(100.0 + x, start + 55.0, 110.0 + x, start + 30.0);
    path.quadraticBezierTo(
      120.0 + x,
      start,
      (140.0 + x) > (size.width - 20.0) ? (size.width - 20.0) : 140.0 + x,
      start,
    );
    path.lineTo(size.width - 20.0, start);

    path.quadraticBezierTo(size.width, start, size.width, start + 25.0);
    path.lineTo(size.width, end - 25.0);
    path.quadraticBezierTo(size.width, end, size.width - 25.0, end);
    path.lineTo(25.0, end);
    path.quadraticBezierTo(0.0, end, 0.0, end - 25.0);
    path.lineTo(0.0, start + 25.0);
    path.quadraticBezierTo(0.0, start, 20.0, start);
    path.close();

    canvas.drawPath(path, paint);

    canvas.drawCircle(Offset(x + 70.0, 50.0), 35.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
