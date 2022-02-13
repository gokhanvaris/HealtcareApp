import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/screens/doctors/doctor_view.dart';
import 'package:healthcare_app/screens/profile/profile_view.dart';
import 'package:healthcare_app/utils/constants.dart';
import 'package:healthcare_app/widgets/custom_searchbar.dart';
import 'package:healthcare_app/widgets/custom_sizedbox.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.home),
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
          print(index);
          _bottomNavIndex = index;
        }),
      ),
      backgroundColor: const Color(0xfffcfbff),
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  SingleChildScrollView buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: KConstant.kHomePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'welcome',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ).tr(),
            CustomSizedBox(height: 5.0),
            Text(
              'welcome_desc',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.grey),
            ).tr(),
            CustomSizedBox(height: 10.0),
            const CustomSearchBar(),
            CustomSizedBox(height: 20.0),
            buildHomeCard(context),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'help_text',
                    style: KConstant.kTextStyle(
                        FontWeight.bold, Colors.black, 18.0),
                  ).tr(),
                  Text(
                    'help_text_search',
                    style: KConstant.kTextStyle(
                        FontWeight.normal, Colors.blue, 14.0),
                  ).tr(),
                ],
              ),
            ),
            Row(
              children: [
                buildCard(const Color(0xff30b3ed), Icons.add_moderator,
                    'help_menu_one', Colors.white),
                buildCard(Colors.grey.shade200, Icons.medical_services_rounded,
                    'help_menu_two', Colors.blue),
                buildCard(Colors.grey.shade200, Icons.health_and_safety,
                    'help_menu_tree', Colors.blue)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'top_rated_text',
                    style: KConstant.kTextStyle(
                        FontWeight.bold, Colors.black, 18.0),
                  ).tr(),
                  Text(
                    'top_rated_search_text',
                    style: KConstant.kTextStyle(
                        FontWeight.normal, Colors.blue, 14.0),
                  ).tr(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 20.0, left: 5.0),
              child: Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    buildDoctorCarrd(),
                    const SizedBox(
                      width: 10,
                    ),
                    buildDoctorCarrd(),
                  ],
                ),
              ),
            ),
            CustomSizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget buildDoctorCarrd() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DoctorView()));
      },
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0x4d9a9a9a),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: 250,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/doctor.png')),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dr. Mustafa UÇAN',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CustomSizedBox(height: 5.0),
                    const Text('Cardiologist'),
                    CustomSizedBox(height: 5.0),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Padding buildCard(Color color, IconData icon, String title, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.only(
          top: KConstant.kHomePadding,
          right: KConstant.kHomePadding,
          left: 12.0),
      child: Container(
        width: 105,
        height: 94,
        decoration: BoxDecoration(
          color: color, //Color(0xff30b3ed),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            CustomSizedBox(height: 15.0),
            Text(
              title,
              style: KConstant.kTextStyle(FontWeight.normal, iconColor, 12.0),
            ).tr(),
          ],
        ),
      ),
    );
  }

  Padding buildHomeCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Center(
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(20.0),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff8cdafc),
                  Color(0xe61aabeb),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(KConstant.kHomePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'banner_text',
                      style: KConstant.kTextStyle(
                          FontWeight.bold, Colors.white, 14.0),
                    ).tr(),
                    CustomSizedBox(height: 10),
                    Text(
                      'banner_desc',
                      style: KConstant.kTextStyle(
                          FontWeight.bold, Colors.white, 14.0),
                    ).tr(),
                    CustomSizedBox(height: 5),
                    Text(
                      'banner_desc1',
                      style: KConstant.kTextStyle(
                          FontWeight.bold, Colors.white, 14.0),
                    ).tr(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset('assets/images/doctor.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: KConstant.appBarColor,
    elevation: 0.0,
    leading: const Icon(
      Icons.menu,
      color: Colors.black,
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: KConstant.kHomePadding),
        child: Icon(
          Icons.more_horiz,
          color: Colors.black,
        ),
      )
    ],
  );
}
