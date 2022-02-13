import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/screens/notification/notification_view.dart';
import 'package:healthcare_app/utils/constants.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
          print(index);
          _bottomNavIndex = index;
        }),
      ),
      backgroundColor: Colors.lightBlue[300],
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  Stack buildBody(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.lightBlue[300]),
                    child: CircleAvatar(
                      radius: 16.0,
                      backgroundColor: Color(0xfffcfbff),
                      child: ClipRRect(
                        child: Image.asset('assets/images/doctor.png'),
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yusuf ÇELİK',
                      style: KConstant.kTextStyle(
                          FontWeight.bold, Colors.white, 24.0),
                    ),
                    SizedBox(height: 10),
                    Text('atarli.flutter.uzmani@gmail.com',
                        style: KConstant.kTextStyle(
                            FontWeight.bold, Colors.white, 12.0)),
                    SizedBox(height: 10),
                    Text(
                      '+1 (574) 123-1234',
                      style: KConstant.kTextStyle(
                          FontWeight.bold, Colors.white, 12.0),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        '24',
                        style: KConstant.kTextStyle(
                            FontWeight.bold, Colors.white, 24.0),
                      ),
                      Text(
                        'age',
                        style: KConstant.kTextStyle(
                            FontWeight.normal, Colors.white, 12.0),
                      ).tr(),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'M',
                        style: KConstant.kTextStyle(
                            FontWeight.bold, Colors.white, 24.0),
                      ),
                      Text(
                        'Gender',
                        style: KConstant.kTextStyle(
                            FontWeight.normal, Colors.white, 12.0),
                      ).tr(),
                    ],
                  ),
                  Container(
                    height: 45,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[300],
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Edit Profile',
                        style: KConstant.kTextStyle(
                            FontWeight.normal, Colors.white, 12.0),
                      ).tr(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0),
          ),
          height: MediaQuery.of(context).size.height * 0.60,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: ListView(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    leading: const Icon(Icons.health_and_safety,
                        color: Colors.lightBlue),
                    title: Text('My Doctors').tr(),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.healing_outlined, color: Colors.lightBlue),
                    title: Text('My Appointments').tr(),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_support_outlined,
                        color: Colors.lightBlue),
                    title: Text('Online Consultation').tr(),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    leading: Icon(Icons.report, color: Colors.lightBlue),
                    title: Text('Medical Reports').tr(),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    leading: Icon(Icons.medical_services_outlined,
                        color: Colors.lightBlue),
                    title: Text('Medicine Reminders').tr(),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ],
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.lightBlue[300],
      leading: Icon(Icons.arrow_back),
      title: Text('Profile').tr(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.settings),
        ),
      ],
    );
  }
}
