import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/screens/doctors/doctor_view.dart';
import 'package:healthcare_app/screens/profile/profile_view.dart';
import 'package:healthcare_app/utils/constants.dart';
import 'package:healthcare_app/widgets/custom_sizedbox.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    int _bottomNavIndex = 0;
    return buildScaffold(_bottomNavIndex, context);
  }

  Scaffold buildScaffold(int _bottomNavIndex, BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.home),
        elevation: 10.0,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          Icons.search_sharp,
          Icons.info,
          Icons.favorite,
          Icons.settings
        ],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() {
          if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileView()));
          }
          if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationView()));
          }
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DoctorView()));
          }
          print(index);
          _bottomNavIndex = index;
        }),
      ),
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(KConstant.kHomePadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: KConstant.kTextStyle(
                        FontWeight.bold, Colors.black, 18.0),
                  ).tr(),
                  Text(
                    'See All',
                    style: KConstant.kTextStyle(
                        FontWeight.normal, Colors.lightBlue, 14.0),
                  ).tr(),
                ],
              ),
            ),
            buildNotificationCard(),
            CustomSizedBox(height: 20),
            buildNotificationCard(),
            CustomSizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(KConstant.kHomePadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Earlier',
                    style: KConstant.kTextStyle(
                        FontWeight.bold, Colors.black, 18.0),
                  ).tr(),
                  Text(
                    'See All',
                    style: KConstant.kTextStyle(
                        FontWeight.normal, Colors.lightBlue, 14.0),
                  ).tr(),
                ],
              ),
            ),
            buildNotificationCard(),
            CustomSizedBox(height: 20),
            buildNotificationCard(),
            CustomSizedBox(height: 20),
            buildNotificationCard(),
            CustomSizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Container buildNotificationCard() {
    return Container(
      height: 100,
      width: 400,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          width: 1.0,
          color: Colors.white,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(15.0)),
              child: Image.asset('assets/images/doctor.png'),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Your appointment to visit Dr. Melvin Steve is confirmed on 30 July 2021 at 2:30 pm to 3:00 pm.',
                      style: KConstant.kTextStyle(
                          FontWeight.normal, Colors.grey, 14.0),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '30 min ago',
                    style: KConstant.kTextStyle(
                        FontWeight.normal, Colors.orange, 14.0),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xfffcfbff),
      elevation: 0.0,
      leading: Icon(Icons.arrow_back, color: Colors.black),
      title: Text(
        'Notifications',
        style: KConstant.kTextStyle(FontWeight.normal, Colors.black, 24.0),
      ).tr(),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(Icons.menu, color: Colors.black),
        ),
      ],
    );
  }
}
